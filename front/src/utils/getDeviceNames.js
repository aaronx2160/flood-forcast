const getDeviceNames = (deviceArr, idArr, colName) => {
  const deviceNameArr = []
  if (colName === 'DeviceName') {
    for (let i = 0; i < idArr.length; i++) {
      deviceArr.map(v => {
        if (v.DeviceCode === idArr[i]['DeviceCode']) {
          deviceNameArr.push(v[colName])
        }
      })
    }
  } else {
    for (let i = 0; i < idArr.length; i++) {
      deviceArr.map(v => {
        if (v.DeviceName === idArr[i]['DeviceName']) {
          deviceNameArr.push(v[colName])
        }
      })
    }
  }

  return deviceNameArr
}

export default getDeviceNames
