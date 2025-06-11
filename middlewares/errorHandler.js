module.exports = (error , req , res , next) => {
    console.log(error);
    res.status(500).json({success : false , messgae : 'Internal server error'})
};