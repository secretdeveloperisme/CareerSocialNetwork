function objectifyForm(formArray) {
  let duplicateArray = countDuplicateArray(formArray);
  //serialize data function
  console.log(formArray)
  let returnArray = {};
  for (let i = 0; i < formArray.length; i++){
    if(duplicateArray[formArray[i]['name']] > 1){
      if(formArray[i]['name'].includes(".")){
        let attributes = formArray[i]['name'].split(".");
        let arr = []
        let object = {}
        object[attributes[1]] = formArray[i]['value']
        if(returnArray[attributes[0]] === undefined)
          returnArray[attributes[0]]=[]
        arr = [...returnArray[attributes[0]]];
        arr.push(object)
        returnArray[attributes[0]] = arr;
        continue;
      }
    }
    if(formArray[i]['name'].includes(".")){
      let attributes = formArray[i]['name'].split(".");
      let object = {}
      if(returnArray[attributes[0]] !== undefined)
        object = returnArray[attributes[0]];
      object[attributes[1]] = formArray[i]['value'];
      returnArray[attributes[0]] = object;
      continue;
    }
    returnArray[formArray[i]['name']] = formArray[i]['value'];
  }
  return returnArray;
}
function filterArrToParams(filters){
  let filterObj = {}
  filters.forEach(filter=>{
    filterObj[filter.field] = filter.value;
  })
  console.log(filterObj)
  return $.param(filterObj);
}
// #back up
// function objectifyForm(formArray) {
//   let duplicateArray = countDuplicateArray(formArray);
//   //serialize data function
//   console.log(formArray)
//   let returnArray = {};
//   for (let i = 0; i < formArray.length; i++){
//     if(duplicateArray[formArray[i]['name']] > 1){
//       if(formArray[i]['name'].includes(".")){
//         let attributes = formArray[i]['name'].split(".");
//         let arr = []
//         let object = {}
//         object[attributes[1]] = formArray[i]['value']
//         if(returnArray[attributes[0]] === undefined)
//           returnArray[attributes[0]]=[]
//         arr = [...returnArray[attributes[0]]];
//         arr.push(object)
//         returnArray[attributes[0]] = arr;
//         continue;
//       }
//     }
//     if(formArray[i]['name'].includes(".")){
//       let attributes = formArray[i]['name'].split(".");
//       let object = {}
//       object[attributes[1]] = formArray[i]['value'];
//       returnArray[attributes[0]] = object;
//       continue;
//     }
//     returnArray[formArray[i]['name']] = formArray[i]['value'];
//   }
//   return returnArray;
// }
function countDuplicateArray(arr){
  const counts = {};
  arr.forEach(function (x) { counts[x.name] = (counts[x.name] || 0) + 1; });
  return counts
}

export {objectifyForm, filterArrToParams}