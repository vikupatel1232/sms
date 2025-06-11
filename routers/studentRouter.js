const express = require('express');
const router = express.Router();
const hendler = require('../controllers/studentHandler')

router.get('/getStudentData',hendler.getStudents);
router.post('/addStudent', hendler.createStudents);
router.get('/getStudentsById/:id', hendler.getStudentsById)
router.put('/updateStudents' ,  hendler.updateStudentsData)
router.delete('/deleteStudent/:id', hendler.deletStudent)

module.exports = router;