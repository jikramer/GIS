
<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html" xmlns:color="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="layout" content="main">

    </head>

<div class="container">

    <div id="initialLandingPageContent" style="display:block";>
        <div class="page-header">
            <h2>Golf Improvement System</h2>
        </div>


        <div class = "blockquote">
            Welcome to the Golf Improvement System!  The Golf Improvement System will collect a batch of data
            from your golf game, apply our predictive analytics and classification tools, and generate a report
            for you to better understand what areas of your game are impacting your scores the most, how different attributes of your
            game stacks up against Touring Pros, and what to target to improve your scores.

        </div>
        <br>

        <div class = "blockquote">
            <strong>Please have the following information available before proceeding to the application page:</strong>
        </div>
        <br>

            <div class="col-md-6" >
                <ul>
                    <b><i>Detail about your Round of Golf:</i></b>
                 </ul>

                <ul>
                    <li> Number of Birdies</li>
                    <li> Number of Bogeys</li>
                    <li> Number of Pars</li>
                    <li> Number of Greens in Regulation</li>
                    <li> Number of attempts Scrambling from 10-20 yards</li>
                    <li> Number of successes Scrambling from 10-20 yards</li>
                    <li> Par for the course</li>
                    <li> Number of sand saves</li>
                    <li> Approximate total Driving Distance</li>
                    <li> Number of putts made between 10-15 feet</li>
                    <li> Number of putts made between 20-25 feet</li>
                 </ul>
            <br>
            </div>

            <div class="col-md-6" >

                <ul>
                    <b><i>Detail about Golf Shots during your Round :</i></b>
                 </ul>

                <ul>
                    <li> Number of Greens Hit</li>
                    <li> Number of Fairways Hit</li>
                    <li> Number of Sand Saves</li>
                    <li> Average approach shot distance to the pin</li>
                    <li> Average made putt distance</li>
                    <li> Number of total putts </li>
                    <li> Par for the course</li>
                    <li> Course Yardage</li>
                  </ul>
            <br>
            </div>
        <br>

       <div class="form-group">
            <button type="submit" class="btn btn-primary" onclick="showRounds()">Proceed</button>
            <button type="submit" class="btn btn-primary" onclick="showRevisitLater()">Revisit Later</button>
        </div>

    </div>

    <div id="revisitLater" style="display:none";>

        <div class="page-header">
            <h2>Golf Information System</h2>
        </div>

        <div class = "blockquote">
            Please return when you have the necessary information to improve your golf game!
             <br><br>
             Thank you for your interest.
             <br><br><br><br><br><br><br><br><br><br>
        </div>
        <br>
    </div>


    <div id="golfRounds" style="display:none";>
        <div class="page-header">
            <h2>Golf Improvement System</h2>
        </div>
                    <div class = "blockquote">
                        Please enter the following information about your golf round:
                    </div>
                    <br>

                    <div class="panel panel-default">
                        <div class="panel-heading">Golf Round Information</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3" >
                                    <label for="birdies" class="control-label">Number of Birdies:</label>
                                    <input type="text" class="form-control" id="birdies" name="birdies">
                                </div>

                                <div class="col-md-3" >
                                    <label for="bogies" class="control-label">Number of Bogies:</label>
                                    <input type="text" class="form-control" id="bogies" name="bogies">
                                </div>

                                <div class="col-md-3" >
                                    <label for="pars" class="control-label">Number of Pars:</label>
                                    <input type="text"  class="form-control" id="pars" name="pars">
                                </div>

                                   <div class="col-md-3" >
                                    <label for="course_par" class="control-label">Course Par:</label>
                                    <input type="text" class="form-control" id="course_par" name="course_par">
                                </div>

                            </div>
                            <div class="row">

                                <div class="col-md-3" >
                                    <label for="greens_in_reg" class="control-label">Total Greens in Regulation:</label>
                                    <input type="text"  class="form-control" id="greens_in_reg" name="greens_in_reg">
                                </div>

                                <div class="col-md-3" >
                                    <label for="scrambling_10_20_attempts" class="control-label">Scrambling Attempts from 10-20 yards:</label>
                                    <input type="text" class="form-control" id="scrambling_10_20_attempts" name="scrambling_10_20_attempts">
                                </div>

                                <div class="col-md-3" >
                                    <label for="scrambling_10_20_successes" class="control-label">Scrambling Successes from 10-20 yards:</label>
                                    <input type="text" class="form-control" id="scrambling_10_20_successes" name="scrambling_10_20_successes">
                                </div>


                                <div class="col-md-3" >
                                    <label for="sand_saves" class="control-label">Sand saves (number of):</label>
                                    <input type="text" class="form-control" id="sand_saves" name="sand_saves">
                                </div>


                            </div>

                            <div class="row">

                                <div class="col-md-4" >
                                    <label for="putts10_15_made" class="control-label">Number of Putts 10-15 ft made:</label>
                                    <input type="text" class="form-control" id="putts10_15_made" name="putts10_15_made">
                                </div>

                                <div class="col-md-4" >
                                    <label for="putts20_25_made" class="control-label">Number of Putts 20-25 ft made:</label>
                                    <input type="text" class="form-control" id="putts20_25_made" name="putts20_25_made">
                                </div>

                                <div class="col-md-4" >
                                    <label for="total_driving_distance" class="control-label">Driving Distance (average):</label>
                                    <input type="text" class="form-control" id="total_driving_distance" name="total_driving_distance">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary" onclick="showHoles()">Next</button>
                    </div>

                </div>


                <div id="golfHoles" style="display:none";>
                    <g:form  action="processSubmission" method="POST" >
                        <div class="page-header">
                            <h2>Golf Information System</h2>
                        </div>
                        <div class = "blockquote">
                            Please enter the following information about your golf shots per hole:
                        </div>
                        <br>

                        <div class="panel panel-default">
                            <div class="panel-heading">Golf Shots</div>
                            <div class="panel-body">

                            <div class="row">
                                <div class="col-md-4" >
                                   <label for="greens_hit" class="control-label">Number of Greens Hit:</label>
                                    <input type="text" class="form-control" id="greens_hit" name="greens_hit">
                                </div>

                                <div class="col-md-4" >
                                    <label for="fairways_hit" class="control-label">Number of Fairways Hit:</label>
                                    <input type="text" class="form-control" id="fairways_hit" name="fairways_hit">
                                 </div>


                                <div class="col-md-4" >
                                    <label for="approx_shot_prox_to_hole" class="control-label">Approximate shot distance to hole:</label>
                                    <input type="text" class="form-control" id="approx_shot_prox_to_hole" name="approx_shot_prox_to_hole">
                                </div>


                            </div>

                                <div class="row">


                                    <div class="col-md-4" >
                                        <label for="average_par_per_hole" class="control-label">Average Par Per Hole</label>
                                        <input type="text" class="form-control" id="average_par_per_hole" name="average_par_per_hole">
                                    </div>

                                    <div class="col-md-4" >
                                        <label for="putts_avg_per_hole" class="control-label">Average number of putts per hole</label>
                                        <input type="text" class="form-control" id="putts_avg_per_hole" name="putts_avg_per_hole">
                                    </div>

                                    <div class="col-md-4" >
                                        <label for="total_number_of_putts" class="control-label">Number of putts total</label>
                                        <input type="text" class="form-control" id="total_number_of_putts" name="total_number_of_putts">
                                    </div>


                                </div>

                                <div class="row">
                                </div>


                                <div class="col-md-4" >
                                    <label for="average_made_putt_distance" class="control-label">Average made putt distance</label>
                                    <input type="text" class="form-control" id="average_made_putt_distance" name="average_made_putt_distance">
                                </div>


                                <div class="col-md-4" >
                                        <label for="total_yardage" class="control-label">Total course yardage ( from tees played ) </label>
                                        <input type="text" class="form-control" id="total_yardage" name="total_yardage">
                                    </div>
                                </div>
                        </div>

                        <input type="hidden" name="hBirdies" id="hBirdies" >
                        <input type="hidden" name="hBogies" id="hBogies" >
                        <input type="hidden" name="hPars" id="hPars" >
                        <input type="hidden" name="hCoursePar" id="hCoursePar" >

                        <input type="hidden" name="hGreensInReg" id="hGreensInReg" >
                        <input type="hidden" name="hScrambling_10_20_attempts" id="hScrambling_10_20_attempts" >
                        <input type="hidden" name="hScrambling_10_20_successess" id="hScrambling_10_20_successess" >
                        <input type="hidden" name="hSandSaves" id="hSandSaves" >


                        <input type="hidden" name="hPutts_10_15_made" id="hPutts_10_15_made" >
                        <input type="hidden" name="hPutts_20_25_made" id="hPutts_20_25_made" >
                        <input type="hidden" name="hTotalDrivingDistance" id="hTotalDrivingDistance" >
                        <input type="hidden" name="hCourseYardage" id="hCourseYardage" >


                        <br>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary" >Submit</button>
                        </div>

                       </div>
                </g:form>

        </div>
    </body>
</html>