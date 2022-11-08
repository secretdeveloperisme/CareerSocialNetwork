function formatDate(timestamp, onlyDate = false){
  let date = new Date(timestamp);
  let month = date.getMonth() + 1;
  let dateOfMonth = date.getDate();
  let year = date.getFullYear()
  let hour = date.getHours()
  let minutes = date.getMinutes();
  let formatDateStr = `${month < 10?'0'+month:month}/${dateOfMonth<10?'0'+dateOfMonth:dateOfMonth}/${year}`;
  let formatTimeStr = `${hour < 10 ? '0' + hour : hour}:${minutes < 10 ? '0' + minutes : minutes}`;
  return onlyDate?formatDateStr:formatDateStr+", "+formatTimeStr;
}
export {formatDate}