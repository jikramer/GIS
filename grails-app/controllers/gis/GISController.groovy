package gis


class GISController {
    def golfService

    def index() {
        render( view: 'index')
    }

     def processSubmission(){
         Round round = buildRound();
         Hole hole = buildHole();
         List<String> playerRoundValueList = golfService.processRoundInfo(round)
         List<String> playerHoleValueList = golfService.processHoleInfo(hole)

         render (view : 'report', model: [playerRoundValueList: playerRoundValueList, playerHoleValueList: playerHoleValueList])
     }

    private Round buildRound(){
        Round round = new Round();

        round.birds = params.get("hBirdies")
        round.bogies = params.get("hBogies")
        round.pars = params.get("hPars")
        round.coursePar  = params.get("hCoursePar")

        round.greensInReg  = params.get("hGreensInReg")
        round.scrambling_attempt_10_20  = params.get("hScrambling_10_20_attempts")
        round.scrambling_success_10_20 = params.get("hScrambling_10_20_successess")
        round.sandSaves  = params.get("hSandSaves")

        round.putts10_15_made = params.get("hPutts_10_15_made")
        round.putts20_25_made = params.get("hPutts_20_25_made")
        round.totalDrivingDistance  = params.get("hTotalDrivingDistance")
        round.courseYardage = params.get("hCourseYardage")

        return round;

    }

     private Hole buildHole(){
         Hole hole = new Hole();
         hole.hitGreen =  params.get("greens_hit")
         hole.hitFairway =  params.get("fairways_hit");
         hole.approachShotProximityToHole = params.get("approx_shot_prox_to_hole");

         hole.avgMadePuttDistance = params.get("average_made_putt_distance");
         hole.par = params.get("average_par_per_hole");
         hole.puttsAvgPerHole = params.get("putts_avg_per_hole");
         hole.putts = params.get("total_number_of_putts");
         hole.actualYardage = params.get("total_yardage");

        return hole;

    }
}
