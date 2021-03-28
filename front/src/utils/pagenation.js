const pageNation = (arr, pageNum, scale) => {
  pageNum = pageNum - 1
  let totalPage =
    arr.length % scale === 0
      ? arr.length / scale
      : Math.ceil(arr.length / scale)

  let start = pageNum * scale
  let end = pageNum * scale + scale
  const newArr = arr.slice(start, end)
  return { totalPage, newArr }
}

export default pageNation
