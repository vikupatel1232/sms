const db = require('../config/db');
const { succes , errors } = require('../helpers/respones')

exports.getStudents = async (req, res) => {
    try {

        const page = req.body.page || 1
        const limit = req.body.limit || 5
        const offset = (page - 1) * limit;

        const data = await db.query("select * from sms.students s limit $1 offset $2 ;" , {
            bind : [limit , offset ], 
             type: db.QueryTypes.SELECT,
        });

        const [totalData] = await db.query("select count(*) from sms.students s;",{
            type: db.QueryTypes.SELECT,
        })
        let total = totalData.count;
       succes(res ,  { data , page , totalPage :Math.ceil(total / limit) , total }  , "Student data get")
        
    } catch (error) {
        console.log(error)
        errors(res , "Failed fatch data")
    }
}

exports.createStudents = async (req,res) => {
    try {

        const {name , email , age , marks } = req.body
       
        const studentQuery = `insert into sms.students (name , email , age ) values ($1,$2,$3) returning id`;
        const studentInsert = await db.query(studentQuery , {
        bind: [name , email , age],
        type: db.QueryTypes.INSERT,
       },);

       let studentId = studentInsert[0][0].id;

       for ( let mark of  marks) {
            const addMarks =  await db.query(`insert into sms.marks (student_id , subject , score) values($1,$2,$3);`, {
            bind : [studentId ,  mark.subject , mark.score ],
            type: db.QueryTypes.INSERT,
        })
       }

       succes(res , { studentId } , "Student create succesfully")
        
    } catch (error) {
        console.log(error)
        errors(res, "Somting wrong creating student")
    }
}

exports.getStudentsById = async (req, res) => {
    try {

        const student_id = req.params.id
        const data = await db.query(`
          select s."name" as name , s.email as email , s.age as age ,json_agg(json_build_object(
          'subject' , m.subject , 'scor' , m.score)) from sms.students s 
          left join sms.marks m on s.id = m.student_id
          where s.id = $1
          group by s.id;` , {
             bind : [student_id],
             type: db.QueryTypes.SELECT,
        });
       succes(res ,  data  , "Student get succesfully")
        
    } catch (error) {
        console.log(error)
        errors(res , "Failed get student data")
    }
}

exports.updateStudentsData = async (req, res) => {
    try {

       const { name , email , age ,  student_id} =  req.body;
        const data = await db.query("update sms.students s set name = $1 , email = $2 , age = $3 where id = $4 ;" , {
             bind : [name , email , age ,  student_id],
             type: db.QueryTypes.UPDATE,
        });
       succes(res ,  null  , "Student Data update succesfully")
        
    } catch (error) {
        console.log(error)
        errors(res , "Failed to update student data")
    }
}

exports.deletStudent = async (req , res) =>{
    try {
        
        const student_id = req.params.id;
         const deletMarks = await db.query("delete from sms.marks where student_id = $1 ;", { 
            bind: [ student_id],
            type : db.QueryTypes.DELETE
        })
        const deletStudent = await db.query("delete from sms.students where id = $1 ;", { 
            bind: [ student_id],
            type : db.QueryTypes.DELETE
        })

        succes(res , null , "Student Deleted")

    } catch (error) {
        console.log(error)
        errors(res,"Failed Delete student")
    }
}