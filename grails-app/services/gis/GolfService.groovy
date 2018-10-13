package gis

import grails.transaction.Transactional

@Transactional
class GolfService {

        List<String> processRoundInfo(Round round){
            List<String> playerRoundList = new ArrayList<>();
            playerRoundList.add(round.birds);
            playerRoundList.add(round.bogies);
            playerRoundList.add(round.pars);
            playerRoundList.add(round.greensInReg);

            playerRoundList.add(round.coursePar);
            playerRoundList.add(round.scrambling_attempt_10_20);
            playerRoundList.add(round.scrambling_success_10_20);
            playerRoundList.add(round.sandSaves);

            playerRoundList.add(round.totalDrivingDistance);
//            playerRoundList.add(round.courseYardage);
            playerRoundList.add(round.putts10_15_made);
            playerRoundList.add(round.putts20_25_made);

            return playerRoundList

        }


    List<String>processHoleInfo(Hole hole){
            List<String> playerHoleList = new ArrayList<>();
            playerHoleList.add(hole.hitGreen)
            playerHoleList.add(hole.hitFairway)
            playerHoleList.add(hole.approachShotProximityToHole)

            playerHoleList.add(hole.avgMadePuttDistance)
            playerHoleList.add(hole.puttsAvgPerHole)

            playerHoleList.add(hole.par)
            playerHoleList.add(hole.putts)
            playerHoleList.add(hole.actualYardage)

            return playerHoleList
    }
}
