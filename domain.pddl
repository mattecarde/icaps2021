(define (domain RFIStation)
  (:requirements :strips :typing :fluents :time :negative-preconditions :timed-initial-literals)
  (:types train itinerary flag trackSeg endpoint stop)
  (:constants
    I1 - itinerary
    I3 - itinerary
    I2 - itinerary
    EP1 - endpoint
    trackSegS - trackSeg
    trackSegR - trackSeg
    trackSegQ - trackSeg
    trackSegP - trackSeg
    trackSegO - trackSeg
    trackSegN - trackSeg
    trackSegM - trackSeg
    trackSegX - trackSeg
    trackSegV - trackSeg
    trackSegU - trackSeg
    trackSegT - trackSeg
    trackSegA - trackSeg
    trackSegB - trackSeg
    trackSegD - trackSeg
    trackSegE - trackSeg
    trackSegF - trackSeg
    trackSegG - trackSeg
    trackSegH - trackSeg
    trackSegI - trackSeg
    trackSegL - trackSeg
    trackSegC - trackSeg
    F_I - flag
    F_II - flag
    F_III - flag
    F_IV - flag
    T1 - train
    S_I - stop
  )
  (:predicates
    (alwaysFalse )
    (trainEntersStationAt ?t - train ?f - flag)
    (trainExitsStationAt ?t - train ?f - flag)
    (trainHasEnteredStation ?t - train)
    (trainHasExitedStation ?t - train)
    (trainHasEndedVoy ?t - train)
    (trainInItinerary ?t - train ?i - itinerary)
    (trainIsAtEndpoint ?t - train ?e - endpoint)
    (trainIsOverlapping ?t - train)
    (trainIsStopping ?t - train)
    (trainIsStoppingAtStop ?t - train ?s - stop)
    (trainHasStopped ?t - train)
    (trainHasArrivedAtStation ?t - train)
    (trainHasStoppedAtStop ?t - train ?s - stop)
    (trainHasCompletedItinerary ?t - train ?i - itinerary)
    (trainHasBegunVoy ?t - train)
    (itinerariesIntersects ?a - itinerary ?b - itinerary)
    (itineraryIsReserved ?i - itinerary)
    (itineraryIsBlockedDueToIntersection ?i - itinerary)
    (itineraryIsBlockedDueToIntersectionByTrain ?i - itinerary ?t - train)
    (flagIsBlockedDueToOverlap ?f - flag)
    (trackSegBlocked ?b - trackSeg)
    (trackSegWasCleared ?b - trackSeg)
    (stopIsOccupied ?s - stop)
  )
  (:functions
    (time )
    (timeElapsedReservedItinerary ?i - itinerary)
    (timeElapsedOverlappedFlag ?f - flag)
    (trainStayInStation ?t - train)
    (trainTimeFromArrival ?t - train)
    (trainStopTime ?t - train)
    (trainEntryIndex ?t - train)
    (trainsArrivedAtEndpoint ?e - endpoint)
    (trainsEnteredFromEndpoint ?e - endpoint)
  )
  (:event T1_arrivesAtEndpoint_EP1
    :parameters()
    :precondition (and
      (>= time 5 )
      (not (trainHasEnteredStation T1))
      (not (trainIsAtEndpoint T1 EP1))
    )
    :effect (and
      (trainIsAtEndpoint T1 EP1)
      (trainHasArrivedAtStation T1)
      (assign (trainEntryIndex T1) (trainsArrivedAtEndpoint EP1))
      (increase (trainsArrivedAtEndpoint EP1) 1 )
    )
  )
  (:action T1_entersStation_I1
    :parameters()
    :precondition (and
      (trainIsAtEndpoint T1 EP1)
      (not (trainHasExitedStation T1))
      (not (trainHasEnteredStation T1))
      (= (trainEntryIndex T1) (trainsEnteredFromEndpoint EP1))
      (not (trackSegBlocked trackSegA))
      (not (trackSegBlocked trackSegB))
    )
    :effect (and
      (not (trainIsAtEndpoint T1 EP1))
      (itineraryIsReserved I1)
      (not (trainEntersStationAt T1 F_I))
      (trainInItinerary T1 I1)
      (trainHasEnteredStation T1)
      (increase (trainsEnteredFromEndpoint EP1) 1 )
      (trackSegBlocked trackSegA)
      (trackSegBlocked trackSegB)
    )
  )
  (:action T1_exitsStation_I2
    :parameters()
    :precondition (and
      (trainHasCompletedItinerary T1 I2)
      (not (trainHasExitedStation T1))
    )
    :effect (and
      (not (itineraryIsReserved I2))
      (not (trainInItinerary T1 I2))
      (trainExitsStationAt T1 F_IV)
      (assign (timeElapsedReservedItinerary I2) 0 )
      (trainHasExitedStation T1)
      (not (trackSegBlocked trackSegP))
      (not (trackSegBlocked trackSegQ))
      (not (trackSegBlocked trackSegR))
      (not (trackSegBlocked trackSegS))
      (not (trackSegBlocked trackSegT))
      (not (trackSegBlocked trackSegU))
      (not (trackSegBlocked trackSegV))
      (not (trackSegBlocked trackSegX))
    )
  )
  (:event T1_completeItinerary_I1
    :parameters()
    :precondition (and
      (>= (timeElapsedReservedItinerary I1) 5 )
      (itineraryIsReserved I1)
      (trainInItinerary T1 I1)
      (not (trainHasCompletedItinerary T1 I1))
      (not (trainHasExitedStation T1))
    )
    :effect (and
      (trainHasCompletedItinerary T1 I1)
    )
  )
  (:event T1_completeTrackSeg_I1_trackSegA_trackSegB
    :parameters()
    :precondition (and
      (>= (timeElapsedReservedItinerary I1) 5 )
      (trainInItinerary T1 I1)
      (trackSegBlocked trackSegA)
      (trackSegBlocked trackSegB)
    )
    :effect (and
      (not (trackSegBlocked trackSegA))
      (not (trackSegBlocked trackSegB))
    )
  )
  (:event T1_completeItinerary_I3
    :parameters()
    :precondition (and
      (>= (timeElapsedReservedItinerary I3) 5 )
      (itineraryIsReserved I3)
      (trainInItinerary T1 I3)
      (not (trainHasCompletedItinerary T1 I3))
      (not (trainHasExitedStation T1))
    )
    :effect (and
      (trainHasCompletedItinerary T1 I3)
    )
  )
  (:event T1_completeTrackSeg_I3_trackSegC
    :parameters()
    :precondition (and
      (>= (timeElapsedReservedItinerary I3) 0 )
      (trainInItinerary T1 I3)
      (trackSegBlocked trackSegC)
    )
    :effect (and
      (not (trackSegBlocked trackSegC))
    )
  )
  (:event
  T1_completeTrackSeg_I3_trackSegD_trackSegE_trackSegF_trackSegG_trackSegH_trackSegI
    :parameters()
    :precondition (and
      (>= (timeElapsedReservedItinerary I3) 3 )
      (trainInItinerary T1 I3)
      (trackSegBlocked trackSegD)
      (trackSegBlocked trackSegE)
      (trackSegBlocked trackSegF)
      (trackSegBlocked trackSegG)
      (trackSegBlocked trackSegH)
      (trackSegBlocked trackSegI)
    )
    :effect (and
      (not (trackSegBlocked trackSegD))
      (not (trackSegBlocked trackSegE))
      (not (trackSegBlocked trackSegF))
      (not (trackSegBlocked trackSegG))
      (not (trackSegBlocked trackSegH))
      (not (trackSegBlocked trackSegI))
    )
  )
  (:event T1_completeTrackSeg_I3_trackSegL
    :parameters()
    :precondition (and
      (>= (timeElapsedReservedItinerary I3) 3 )
      (trainInItinerary T1 I3)
      (trackSegBlocked trackSegL)
    )
    :effect (and
      (not (trackSegBlocked trackSegL))
    )
  )
  (:event T1_completeTrackSeg_I3_trackSegM_trackSegN_trackSegO
    :parameters()
    :precondition (and
      (>= (timeElapsedReservedItinerary I3) 5 )
      (trainInItinerary T1 I3)
      (trackSegBlocked trackSegM)
      (trackSegBlocked trackSegN)
      (trackSegBlocked trackSegO)
    )
    :effect (and
      (not (trackSegBlocked trackSegM))
      (not (trackSegBlocked trackSegN))
      (not (trackSegBlocked trackSegO))
    )
  )
  (:action T1_beginStop_I3_S_I
    :parameters()
    :precondition (and
      (trainHasCompletedItinerary T1 I3)
      (trainInItinerary T1 I3)
      (not (trainIsOverlapping T1))
      (not (stopIsOccupied S_I))
      (not (trainIsStopping T1))
      (not (trainHasStoppedAtStop T1 S_I))
    )
    :effect (and
      (trainIsStoppingAtStop T1 S_I)
      (trainIsStopping T1)
      (assign (trainStopTime T1) 0 )
      (stopIsOccupied S_I)
      (not (itineraryIsReserved I3))
      (not (trackSegBlocked trackSegC))
      (not (trackSegBlocked trackSegD))
      (not (trackSegBlocked trackSegE))
      (not (trackSegBlocked trackSegF))
      (not (trackSegBlocked trackSegG))
      (not (trackSegBlocked trackSegH))
      (not (trackSegBlocked trackSegI))
      (not (trackSegBlocked trackSegL))
    )
  )
  (:event T1_endStop_I3_S_I
    :parameters()
    :precondition (and
      (>= (trainStopTime T1) 1 )
      (trainInItinerary T1 I3)
      (trainIsStoppingAtStop T1 S_I)
      (stopIsOccupied S_I)
    )
    :effect (and
      (assign (trainStopTime T1) 0 )
      (not (trainIsStoppingAtStop T1 S_I))
      (not (trainIsStopping T1))
      (trainHasStoppedAtStop T1 S_I)
      (trainHasStopped T1)
      (not (stopIsOccupied S_I))
    )
  )
  (:event T1_completeItinerary_I2
    :parameters()
    :precondition (and
      (>= (timeElapsedReservedItinerary I2) 5 )
      (itineraryIsReserved I2)
      (trainInItinerary T1 I2)
      (not (trainHasCompletedItinerary T1 I2))
      (not (trainHasExitedStation T1))
    )
    :effect (and
      (trainHasCompletedItinerary T1 I2)
    )
  )
  (:event T1_completeTrackSeg_I2_trackSegP_trackSegQ
    :parameters()
    :precondition (and
      (>= (timeElapsedReservedItinerary I2) 1 )
      (trainInItinerary T1 I2)
      (trackSegBlocked trackSegP)
      (trackSegBlocked trackSegQ)
    )
    :effect (and
      (not (trackSegBlocked trackSegP))
      (not (trackSegBlocked trackSegQ))
    )
  )
  (:event T1_completeTrackSeg_I2_trackSegR
    :parameters()
    :precondition (and
      (>= (timeElapsedReservedItinerary I2) 1 )
      (trainInItinerary T1 I2)
      (trackSegBlocked trackSegR)
    )
    :effect (and
      (not (trackSegBlocked trackSegR))
    )
  )
  (:event T1_completeTrackSeg_I2_trackSegS
    :parameters()
    :precondition (and
      (>= (timeElapsedReservedItinerary I2) 2 )
      (trainInItinerary T1 I2)
      (trackSegBlocked trackSegS)
    )
    :effect (and
      (not (trackSegBlocked trackSegS))
    )
  )
  (:event T1_completeTrackSeg_I2_trackSegT_trackSegU_trackSegV_trackSegX
    :parameters()
    :precondition (and
      (>= (timeElapsedReservedItinerary I2) 5 )
      (trainInItinerary T1 I2)
      (trackSegBlocked trackSegT)
      (trackSegBlocked trackSegU)
      (trackSegBlocked trackSegV)
      (trackSegBlocked trackSegX)
    )
    :effect (and
      (not (trackSegBlocked trackSegT))
      (not (trackSegBlocked trackSegU))
      (not (trackSegBlocked trackSegV))
      (not (trackSegBlocked trackSegX))
    )
  )
  (:action T1_overlaps_I1_I3
    :parameters()
    :precondition (and
      (trainHasCompletedItinerary T1 I1)
      (trainInItinerary T1 I1)
      (not (trainIsStopping T1))
      (not (itineraryIsReserved I3))
      (not (flagIsBlockedDueToOverlap F_II))
      (not (trackSegBlocked trackSegC))
      (not (trackSegBlocked trackSegD))
      (not (trackSegBlocked trackSegE))
      (not (trackSegBlocked trackSegF))
      (not (trackSegBlocked trackSegG))
      (not (trackSegBlocked trackSegH))
      (not (trackSegBlocked trackSegI))
      (not (trackSegBlocked trackSegL))
      (not (trackSegBlocked trackSegM))
      (not (trackSegBlocked trackSegN))
      (not (trackSegBlocked trackSegO))
    )
    :effect (and
      (itineraryIsReserved I3)
      (trainInItinerary T1 I3)
      (trainIsOverlapping T1)
      (flagIsBlockedDueToOverlap F_II)
      (trackSegBlocked trackSegC)
      (trackSegBlocked trackSegD)
      (trackSegBlocked trackSegE)
      (trackSegBlocked trackSegF)
      (trackSegBlocked trackSegG)
      (trackSegBlocked trackSegH)
      (trackSegBlocked trackSegI)
      (trackSegBlocked trackSegL)
      (trackSegBlocked trackSegM)
      (trackSegBlocked trackSegN)
      (trackSegBlocked trackSegO)
    )
  )
  (:event T1_endOverlap_I1_I3
    :parameters()
    :precondition (and
      (>= (timeElapsedOverlappedFlag F_II) 1 )
      (flagIsBlockedDueToOverlap F_II)
      (trainInItinerary T1 I1)
      (trainInItinerary T1 I3)
    )
    :effect (and
      (not (itineraryIsReserved I1))
      (not (trainIsOverlapping T1))
      (assign (timeElapsedReservedItinerary I1) 0 )
      (not (trainInItinerary T1 I1))
      (not (flagIsBlockedDueToOverlap F_II))
      (assign (timeElapsedOverlappedFlag F_II) 0 )
      (not (trackSegBlocked trackSegA))
      (not (trackSegBlocked trackSegB))
    )
  )
  (:action T1_overlaps_I3_I2
    :parameters()
    :precondition (and
      (trainHasCompletedItinerary T1 I3)
      (trainInItinerary T1 I3)
      (not (trainIsStopping T1))
      (not (itineraryIsReserved I2))
      (not (flagIsBlockedDueToOverlap F_III))
      (not (trackSegBlocked trackSegP))
      (not (trackSegBlocked trackSegQ))
      (not (trackSegBlocked trackSegR))
      (not (trackSegBlocked trackSegS))
      (not (trackSegBlocked trackSegT))
      (not (trackSegBlocked trackSegU))
      (not (trackSegBlocked trackSegV))
      (not (trackSegBlocked trackSegX))
    )
    :effect (and
      (itineraryIsReserved I2)
      (trainInItinerary T1 I2)
      (trainIsOverlapping T1)
      (flagIsBlockedDueToOverlap F_III)
      (trackSegBlocked trackSegP)
      (trackSegBlocked trackSegQ)
      (trackSegBlocked trackSegR)
      (trackSegBlocked trackSegS)
      (trackSegBlocked trackSegT)
      (trackSegBlocked trackSegU)
      (trackSegBlocked trackSegV)
      (trackSegBlocked trackSegX)
    )
  )
  (:event T1_endOverlap_I3_I2
    :parameters()
    :precondition (and
      (>= (timeElapsedOverlappedFlag F_III) 1 )
      (flagIsBlockedDueToOverlap F_III)
      (trainInItinerary T1 I3)
      (trainInItinerary T1 I2)
    )
    :effect (and
      (not (itineraryIsReserved I3))
      (not (trainIsOverlapping T1))
      (assign (timeElapsedReservedItinerary I3) 0 )
      (not (trainInItinerary T1 I3))
      (not (flagIsBlockedDueToOverlap F_III))
      (assign (timeElapsedOverlappedFlag F_III) 0 )
      (not (trackSegBlocked trackSegC))
      (not (trackSegBlocked trackSegD))
      (not (trackSegBlocked trackSegE))
      (not (trackSegBlocked trackSegF))
      (not (trackSegBlocked trackSegG))
      (not (trackSegBlocked trackSegH))
      (not (trackSegBlocked trackSegI))
      (not (trackSegBlocked trackSegL))
      (not (trackSegBlocked trackSegM))
      (not (trackSegBlocked trackSegN))
      (not (trackSegBlocked trackSegO))
    )
  )
  (:process incrementElapsedTimeOfReservedItinerary
    :parameters(?i - itinerary)
    :precondition (and
      (itineraryIsReserved ?i)
    )
    :effect (and
      (increase (timeElapsedReservedItinerary ?i) #t )
    )
  )
  (:process incrementOverlapTimeOfBlockedFlag
    :parameters(?f - flag)
    :precondition (and
      (flagIsBlockedDueToOverlap ?f)
    )
    :effect (and
      (increase (timeElapsedOverlappedFlag ?f) #t )
    )
  )
  (:process incrementTrainStayInStation
    :parameters(?t - train)
    :precondition (and
      (trainHasEnteredStation ?t)
      (not (trainHasExitedStation ?t))
    )
    :effect (and
      (increase (trainStayInStation ?t) #t )
    )
  )
  (:process incrementTrainTimeFromArrival
    :parameters(?t - train)
    :precondition (and
      (trainHasArrivedAtStation ?t)
      (not (trainHasExitedStation ?t))
    )
    :effect (and
      (increase (trainTimeFromArrival ?t) #t )
    )
  )
  (:process incrementTrainStopTime
    :parameters(?t - train)
    :precondition (and
      (trainIsStopping ?t)
    )
    :effect (and
      (increase (trainStopTime ?t) #t )
    )
  )
  (:process incrementTime
    :parameters()
    :precondition (and
      (not (alwaysFalse ))
    )
    :effect (and
      (increase time #t )
    )
  )
)
