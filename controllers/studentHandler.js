const db = require('../config/db')

exports.getStudents = async (req, res) => {
    try {
        const data = "test get data";

        res.status(200).json({success : true , message : data})
        
    } catch (error) {
        res.status(500).json({success: false ,  message : "data not get"})
    }
}