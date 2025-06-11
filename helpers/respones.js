exports.succes = (res , data , messgae = 'Scusess') => {
 res.status(200).json({success : true ,data : data, message : messgae})
}

exports.errors = (res , messgae = 'Error') => {
 res.status(500).json({success : false , message : messgae})
}