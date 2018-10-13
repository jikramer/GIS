
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Stat', 'Player', 'Pro Average'],
                ['Number of Birdies', ${playerRoundValueList[0]}, 6],
                ['Number of Bogies', ${playerRoundValueList[1]}, 1],
                ['Number of Pars', ${playerRoundValueList[2]}, 12],
                ['Number of Greens in Regulation', ${playerRoundValueList[3]}, 14],

                ['Par for the course', ${playerRoundValueList[4]}, 70],
                ['Scrambling attempts from 10-20 yards', ${playerRoundValueList[5]}, 4],
                ['Scrambling successes from 10-20 yards', ${playerRoundValueList[6]}, 2],
                ['Number of successful sand saves', ${playerRoundValueList[7]}, 2],
                ['Average Driving Distance', ${playerRoundValueList[8]}, 300],

//                ['Total course Yardage', ${playerRoundValueList[9]}, 7150],
                ['Putts 10-15 feet made', ${playerRoundValueList[9]}, 5],
                ['Putts 20-25 feet made', ${playerRoundValueList[10]}, 2],

                ['Number of Greens Hit', ${playerHoleValueList[0]}, 13],
                ['Number of Fairways Hit', ${playerHoleValueList[1]}, 11],
                ['Average approach shot proximity to hole', ${playerHoleValueList[2]}, 30],

                ['Average made putt distance', ${playerHoleValueList[3]}, 5],
                ['Average number of putts per hole', ${playerHoleValueList[4]}, 1.5],
                ['Average par per hole', ${playerHoleValueList[5]}, 4],
                ['Number of putts for the round', ${playerHoleValueList[6]}, 26],
                ['Actual course Yardage', ${playerHoleValueList[7]}, 7150]

            ]);

            var options = {
                chart: {
                    title: 'Player vs Touring Pro average',
                    subtitle: 'Areas to work on:',
                },
                vAxis: {
                    logScale: true
                },
                hAxis: {
                    showTextEvery: 1,
                    textStyle: {
                        fontSize: 10 // or the number you want
                    },
                    slantedText:true

                },

            };

            var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_report'));
            chart.draw(data, options);
        }
    </script>

</head>

<body>
    <div class = "container">
        <div class="page-header">
            <h2>Golf Improvement System Results</h2>
        </div>

        <div id="columnchart_report" style="height: 400px;"></div>
    </div>
  </body>
</html>