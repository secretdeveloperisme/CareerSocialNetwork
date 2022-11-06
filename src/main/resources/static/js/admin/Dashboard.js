$(async () => {
  let responseGetJobsPerMonthData;
  try{
    responseGetJobsPerMonthData =
        await $.ajax({
          type: "GET",
          url: "/api/job/get-amount-of-jobs-per-month",
        });
  } catch (err){
    console.log(err)
  }
  let jobsPerMonthData = responseGetJobsPerMonthData.data;
  console.log(jobsPerMonthData)
  const labels = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12
  ];

  const data = {
    labels: labels,
    datasets: [{
      label: 'Amount Of Jobs',
      backgroundColor: 'rgb(255, 99, 132)',
      borderColor: 'rgb(255, 99, 132)',
      data: jobsPerMonthData,
    }],
  };
  const config = {
    type: 'line',
    data: data,
    options: {
      parsing: {
        xAxisKey: 'month',
        yAxisKey: 'amountOfJobs'
      }
    }
  };

  const myChart = new Chart(
    document.getElementById('chartPostsPerMonth'),
    config
  );
  console.log(myChart)
})