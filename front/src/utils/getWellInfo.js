const getWellInfoArr = (wellArr, colName) => {
  return wellArr.map(v => {
    return v[colName]
  })
}

export default getWellInfoArr
