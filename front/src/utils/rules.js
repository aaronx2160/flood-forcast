let checkEmail = (rule, value, cb) => {
  const regEmail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/
  if (regEmail.test(value)) {
    return cb()
  }
  cb(new Error('请输入合法邮箱'))
}
let checkMobile = (rule, value, cb) => {
  const regMobile = /^(13[0-9]|14[01456879]|15[0-3,5-9]|16[2567]|17[0-8]|18[0-9]|19[0-3,5-9])\d{8}$/
  if (regMobile.test(value)) {
    return cb()
  }
  cb(new Error('请输入合法手机号'))
}

const validateEmail = (rule, value, callback) => {
  if (!isWscnEmail(value)) {
    callback(new Error('请输入正确的合法邮箱'));
  } else {
    callback();
  }
};
const validatePass = (rule, value, callback) => {
  if (value.length < 6) {
    callback(new Error('密码不能小于6位'));
  } else {
    callback();
  }
};

const rules = {
  required: { required: true, message: '必填区域', trigger: 'blur' },
  number: {
    type: 'number',
    message: '该区域要求填写数字内容',
    trigger: 'change'
  },
  minMax: (min, max) => {
    return {
      min: min,
      max: max,
      message: `该区域要求字符数在${min}-${max}之间`,
      trigger: 'blur'
    }
  },
  phone: {
    validator: checkMobile,
    message: '请输入合法手机号',
    trigger: 'blur'
  },
  email: {
    validator: checkEmail,
    message: '请输入合法邮箱',
    trigger: 'blur'
  }
}

export default rules