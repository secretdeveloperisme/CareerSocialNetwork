let formArray = [
  {
      "name": "image",
      "value": "/api/file/images/upload/22/1665534953689_1665534953689_huubang.png"
  },
  {
      "name": "tags.name",
      "value": "chat"
  },
  {
      "name": "tags.name",
      "value": "me"
  },
  {
      "name": "tags.name",
      "value": "vn"
  },
  {
      "name": "skill.skillId",
      "value": "1"
  },
  {
      "name": "skill.skillId",
      "value": "6"
  },
  {
      "name": "location",
      "value": "ha noi"
  },
  {
      "name": "title",
      "value": "job create1"
  },
  {
      "name": "salaryMin",
      "value": "11"
  },
  {
      "name": "salaryMax",
      "value": "222"
  },
  {
      "name": "amount",
      "value": "3"
  },
  {
      "name": "experience",
      "value": "1"
  },
  {
      "name": "position.positionId",
      "value": "2"
  },
  {
      "name": "workPlace.workPlaceId",
      "value": "2"
  },
  {
      "name": "jobDescription",
      "value": "<p>jbo create jskdfjsdkfjsd <img src=\"/api/file/images/upload/22/1665534948518_1665534948518_nguyen_thi_hoa.png\"></p>"
  }
]

function objectifyForm(formArray, duplicateArray) {
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
        arr = arr.push(object)
        returnArray[attributes[0]] = [object];
        continue;
      }
    }
    if(formArray[i]['name'].includes(".")){
      let attributes = formArray[i]['name'].split(".");
      let object = {}
      object[attributes[1]] = formArray[i]['value'];
      returnArray[attributes[0]] = object;
      continue;
    }
    returnArray[formArray[i]['name']] = formArray[i]['value'];
  }
  return returnArray;
}

function countDuplicateArray(arr){
  const counts = {};
  arr.forEach(function (x) { counts[x.name] = (counts[x.name] || 0) + 1; });
  return counts
}
let duplicateArray = countDuplicateArray(formArray);
console.log(objectifyForm(formArray, duplicateArray));
console.log("end");