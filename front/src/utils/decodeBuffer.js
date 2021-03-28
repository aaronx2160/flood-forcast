const deCodeBuffer = buffer => {
  const bufJ = Buffer.from(buffer)
  let uint8Array = new Uint8Array(bufJ)
  for (let i = 0; i < bufJ.length; ++i) {
    uint8Array[i] = bufJ[i]
  }
  return new TextDecoder('utf-8').decode(uint8Array)
}

export default deCodeBuffer
