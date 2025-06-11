const express = require('express');
const router = express.Router();
const hendler = require('../controllers/studentHandler')

router.get('/getStudentData',hendler.getStudents)

module.exports = router;