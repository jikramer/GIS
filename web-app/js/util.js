


function doHome(){

    if (confirm('Are you sure you want to return to the landing page and reset all fields?')) {
        window.location = "http://localhost:8080/GIS";
    } else {
        // Do nothing!
    }
}


function showRounds() {

//show or hide these divs
    document.getElementById('golfRounds').style.display = "block";
    document.getElementById('golfHoles').style.display = "none";
    document.getElementById('initialLandingPageContent').style.display = "none";
}


function showRevisitLater() {

//show or hide these divs
    document.getElementById('golfRounds').style.display = "none";
    document.getElementById('golfHoles').style.display = "none";
    document.getElementById('initialLandingPageContent').style.display = "none";
    document.getElementById('revisitLater').style.display = "block";
}



function showHoles() {

    var iBirdies;
    var iBogies;
    var iPars;
    var iCoursePar;

    var iPutts10_15_made;
    var iPutts20_25_made;
    var iTotalDrivingDistance;
    var iCourseYardage;

    var iSandSaves;
    var iGreensInReg;
    var iScrambling_10_20_attempts;
    var iScrambling_10_20_successess;


    $("input").each(function () {

        iBirdies = $("#birdies").val();
        iBogies = $("#bogies").val();
        iPars = $("#pars").val();
        iCoursePar = $("#course_par").val();

        iGreensInReg = $("#greens_in_reg").val();
        iScrambling_10_20_attempts = $("#scrambling_10_20_attempts").val();
        iScrambling_10_20_successess = $("#scrambling_10_20_successes").val();
        iSandSaves = $("#sand_saves").val();

        iPutts10_15_made = $("#putts10_15_made").val();
        iPutts20_25_made = $("#putts20_25_made").val();
        iTotalDrivingDistance = $("#total_driving_distance").val();
        iCourseYardage = $("#course_yardage").val();

    });



    //hang on to these values
    localStorage.setItem('iBirdies', iBirdies)
    localStorage.setItem('iBogies', iBogies)
    localStorage.setItem('iPars', iPars)
    localStorage.setItem('iCoursePar', iCoursePar)

    localStorage.setItem('iGreensInReg', iGreensInReg)
    localStorage.setItem('iScrambling_10_20_attempts', iScrambling_10_20_attempts)
    localStorage.setItem('iScrambling_10_20_successess', iScrambling_10_20_successess)
    localStorage.setItem('iSandSaves', iSandSaves)

    localStorage.setItem('iPutts10_15_made', iPutts10_15_made)
    localStorage.setItem('iPutts20_25_made', iPutts20_25_made)
    localStorage.setItem('iTotalDrivingDistance', iTotalDrivingDistance)
    localStorage.setItem('iCourseYardage', iCourseYardage)


    //load values into hidden controls
    document.getElementById("hBirdies").value = iBirdies;
    document.getElementById("hBogies").value = iBogies;
    document.getElementById("hPars").value = iPars;
    document.getElementById("hCoursePar").value = iCoursePar;

    document.getElementById("hGreensInReg").value = iGreensInReg;
    document.getElementById("hScrambling_10_20_attempts").value = iScrambling_10_20_attempts;
    document.getElementById("hScrambling_10_20_successess").value = iScrambling_10_20_successess;
    document.getElementById("hSandSaves").value = iSandSaves;

    document.getElementById("hPutts_10_15_made").value = iPutts10_15_made;
    document.getElementById("hPutts_20_25_made").value = iPutts20_25_made;
    document.getElementById("hTotalDrivingDistance").value = iTotalDrivingDistance;
    document.getElementById("hCourseYardage").value = iCourseYardage;

    //show or hide these divs
    document.getElementById('golfRounds').style.display = "none";
    document.getElementById('initialLandingPageContent').style.display = "none";
    document.getElementById('golfHoles').style.display = "block";

};



