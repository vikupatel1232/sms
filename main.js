const express = require('express');
const app = express();
require('dotenv').config();
const studentRouter = require('./routers/studentRouter')

app.use(express.json())
app.use('/api/student',studentRouter)

const PORT = process.env.PORT || 3000
app.listen(PORT, () => console.log(`Server start on port ${PORT}`))