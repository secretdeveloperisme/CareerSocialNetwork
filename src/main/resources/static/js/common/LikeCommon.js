async function like(targetName, targetId) {
  try{
    let url = ""
    let fieldName;
    if(targetName === "job"){
      url = "/api/job-action/like";
      fieldName = "jobId";
    }
    else {
      url = "/api/post-action/like";
      fieldName = "postId";
    }
    let response = await $.ajax({
      url: url,
      type: "POST",
      data: JSON.stringify({
        typeLike: "LIKE",
        [fieldName]: targetId
      }),
      contentType: "application/json",
    })
    if (response.data !== null) {
      console.log(response)
      return response.data.action;
    }
    else {
      return null;
    }
  }
  catch (err){
    console.log(err)
    return null;
  }
}
export default like