$(async () => {
  // jobs
  let responseGetJobsPerMonthData;
  try {
    responseGetJobsPerMonthData =
        await $.ajax({
          type: "GET",
          url: "/api/job/get-amount-per-month",
        });
  } catch (err) {
    console.log(err)
  }
  let jobsPerMonthData = responseGetJobsPerMonthData.data;
  // posts
  let responseGetPostsPerMonthData;
  try {
    responseGetPostsPerMonthData =
        await $.ajax({
          type: "GET",
          url: "/api/post/get-amount-per-month",
        });
  } catch (err) {
    console.log(err)
  }
  let postsPerMonthData = responseGetPostsPerMonthData.data;
  // companies
  let responseGetCompaniesPerMonthData;
  try {
    responseGetCompaniesPerMonthData =
        await $.ajax({
          type: "GET",
          url: "/api/company/get-amount-per-month",
        });
  } catch (err) {
    console.log(err)
  }
  let companiesPerMonthData = responseGetCompaniesPerMonthData.data;
  console.log(jobsPerMonthData)

  // companies
  let responseGetAmountJobsCompanies;
  try {
    responseGetAmountJobsCompanies =
        await $.ajax({
          type: "GET",
          url: "/api/company/get-amount-jobs",
        });
  } catch (err) {
    console.log(err)
  }
  let amountJobsCompaniesData = responseGetAmountJobsCompanies.data;
  let companyNames= amountJobsCompaniesData.map(value => value.name);
  let amountOfJobsCompanies= amountJobsCompaniesData.map(value => value.amount);
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
  const labelMonths = [
    "JANUARY",
    "FEBRUARY",
    "MARCH",
    "APRIL",
    "MAY",
    "JUNE",
    "JULY",
    "AUGUST",
    "SEPTEMBER",
    "OCTOBER",
    "NOVEMBER",
    "DECEMBER"
  ];

  const data = {
    labels: labels,
    datasets: [
      {
        label: 'Amount Of Jobs',
        backgroundColor: 'rgb(236,227,229)',
        borderColor: 'rgb(255, 99, 132)',
        data: jobsPerMonthData,
      },
      {
        label: 'Amount Of Posts',
        backgroundColor: 'rgb(18,183,198)',
        borderColor: 'rgb(16,115,18)',
        data: postsPerMonthData,
      },
      {
        label: 'Amount Of Companies',
        backgroundColor: 'rgb(132,18,198)',
        borderColor: 'rgb(196,25,25)',
        data: companiesPerMonthData,
      }
    ],
  };


  const configAmount = {
    type: 'line',
    data: data,
    options: {
      scales: {
        x: {
          ticks: {
            callback: function (value, index, tick) {
              return labelMonths[index];
            }
          }
        }
      },
      parsing: {
        xAxisKey: 'month',
        yAxisKey: 'amount'
      }
    }
  };
  const dataAmountJobsCompanies = {
    labels: companyNames,
    datasets: [
      {
        data: amountOfJobsCompanies,
        backgroundColor:[
         "#4b13a5" ,
         "#f93949" ,
         "#82933c" ,
         "#a962e0" ,
         "#1b547c" ,
         "#b5abaf" ,
         "#531382" ,
         "#f96d4d" ,
         "#263826" ,
         "#518911" ,
         "#4c4756" ,
        ]
      }
    ],
  };
  const configPercent = {
    type: 'doughnut',
    data: dataAmountJobsCompanies,

  };

  const myChart = new Chart(
      document.getElementById('chartPostsPerMonth'),
      configAmount
  );
  const percentChart = new Chart(
      document.getElementById('chartPercentOfCompaniesJobs'),
      configPercent
  );
  console.log(myChart)
})