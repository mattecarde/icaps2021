(define (domain RFIStation)
	(:requirements :strips :typing :fluents :time :negative-preconditions :timed-initial-literals)
	(:types train itinerary flag binBit endpoint stop)
	(:constants
		IW1 - itinerary
		IW2 - itinerary
		IW3 - itinerary
		IW4 - itinerary
		IW5 - itinerary
		I1E - itinerary
		I2E - itinerary
		I3E - itinerary
		I4E - itinerary
		I5E - itinerary
		IE1 - itinerary
		IE2 - itinerary
		IE3 - itinerary
		IE4 - itinerary
		IE5 - itinerary
		I1W - itinerary
		I2W - itinerary
		I3W - itinerary
		I4W - itinerary
		I5W - itinerary
		W_plus - endpoint
		W_minus - endpoint
		E_minus - endpoint
		E_plus - endpoint
		cdbaa - binBit
		cdbac - binBit
		cdbaf - binBit
		cdbai - binBit
		cdbap - binBit
		cdbau - binBit
		cdbaz - binBit
		cdbaj - binBit
		cdbal - binBit
		cdbaq - binBit
		cdbav - binBit
		cdbba - binBit
		cdbam - binBit
		cdbar - binBit
		cdbaw - binBit
		cdbbb - binBit
		cdbag - binBit
		cdbak - binBit
		cdban - binBit
		cdbas - binBit
		cdbax - binBit
		cdbbc - binBit
		cdbao - binBit
		cdbat - binBit
		cdbay - binBit
		cdbbd - binBit
		cdbbe - binBit
		cdbbl - binBit
		cdbbo - binBit
		cdbbr - binBit
		cdbbf - binBit
		cdbbj - binBit
		cdbbg - binBit
		cdbbh - binBit
		cdbbk - binBit
		cdbbm - binBit
		cdbbi - binBit
		cdbbs - binBit
		cdbbp - binBit
		cdbbq - binBit
		cdbbn - binBit
		cdbad - binBit
		cdbab - binBit
		cdbah - binBit
		cdbae - binBit
		F01 - flag
		F1R - flag
		F2R - flag
		F3R - flag
		F4R - flag
		F5R - flag
		F03 - flag
		F04 - flag
		F1L - flag
		F2L - flag
		F3L - flag
		F4L - flag
		F5L - flag
		F02 - flag
		T1 - train
		S_I - stop
		S_II - stop
		S_III - stop
		S_IV - stop
		S_V - stop
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
		(binBitIsBlocked ?b - binBit)
		(binBitWasCleared ?b - binBit)
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
	(:event T1_arrivesAtEndpoint_W_plus
		:parameters()
		:precondition (and
			(>= time  5 )
			(not (trainHasEnteredStation T1))
			(not (trainIsAtEndpoint T1 W_plus))
		)
		:effect (and
			(trainIsAtEndpoint T1 W_plus)
			(trainHasArrivedAtStation T1)
			(assign (trainEntryIndex T1) (trainsArrivedAtEndpoint W_plus))
			(increase (trainsArrivedAtEndpoint W_plus) 1 )
		)
	)
	(:action T1_entersStation_IW1
		:parameters()
		:precondition (and
			(trainIsAtEndpoint T1 W_plus)
			(not (trainHasExitedStation T1))
			(not (trainHasEnteredStation T1))
			(= (trainEntryIndex T1) (trainsEnteredFromEndpoint W_plus))
			(not (binBitIsBlocked cdbaa))
			(not (binBitIsBlocked cdbac))
			(not (binBitIsBlocked cdbaf))
			(not (binBitIsBlocked cdbai))
			(not (binBitIsBlocked cdbap))
			(not (binBitIsBlocked cdbau))
			(not (binBitIsBlocked cdbaz))
		)
		:effect (and
			(not (trainIsAtEndpoint T1 W_plus))
			(itineraryIsReserved IW1)
			(not (trainEntersStationAt T1 F01))
			(trainInItinerary T1 IW1)
			(trainHasEnteredStation T1)
			(increase (trainsEnteredFromEndpoint W_plus) 1 )
			(binBitIsBlocked cdbaa)
			(binBitIsBlocked cdbac)
			(binBitIsBlocked cdbaf)
			(binBitIsBlocked cdbai)
			(binBitIsBlocked cdbap)
			(binBitIsBlocked cdbau)
			(binBitIsBlocked cdbaz)
		)
	)
	(:action T1_entersStation_IW2
		:parameters()
		:precondition (and
			(trainIsAtEndpoint T1 W_plus)
			(not (trainHasExitedStation T1))
			(not (trainHasEnteredStation T1))
			(= (trainEntryIndex T1) (trainsEnteredFromEndpoint W_plus))
			(not (binBitIsBlocked cdbaa))
			(not (binBitIsBlocked cdbac))
			(not (binBitIsBlocked cdbaf))
			(not (binBitIsBlocked cdbaj))
			(not (binBitIsBlocked cdbal))
			(not (binBitIsBlocked cdbaq))
			(not (binBitIsBlocked cdbav))
			(not (binBitIsBlocked cdbba))
		)
		:effect (and
			(not (trainIsAtEndpoint T1 W_plus))
			(itineraryIsReserved IW2)
			(not (trainEntersStationAt T1 F01))
			(trainInItinerary T1 IW2)
			(trainHasEnteredStation T1)
			(increase (trainsEnteredFromEndpoint W_plus) 1 )
			(binBitIsBlocked cdbaa)
			(binBitIsBlocked cdbac)
			(binBitIsBlocked cdbaf)
			(binBitIsBlocked cdbaj)
			(binBitIsBlocked cdbal)
			(binBitIsBlocked cdbaq)
			(binBitIsBlocked cdbav)
			(binBitIsBlocked cdbba)
		)
	)
	(:action T1_entersStation_IW3
		:parameters()
		:precondition (and
			(trainIsAtEndpoint T1 W_plus)
			(not (trainHasExitedStation T1))
			(not (trainHasEnteredStation T1))
			(= (trainEntryIndex T1) (trainsEnteredFromEndpoint W_plus))
			(not (binBitIsBlocked cdbaa))
			(not (binBitIsBlocked cdbac))
			(not (binBitIsBlocked cdbaf))
			(not (binBitIsBlocked cdbaj))
			(not (binBitIsBlocked cdbam))
			(not (binBitIsBlocked cdbar))
			(not (binBitIsBlocked cdbaw))
			(not (binBitIsBlocked cdbbb))
		)
		:effect (and
			(not (trainIsAtEndpoint T1 W_plus))
			(itineraryIsReserved IW3)
			(not (trainEntersStationAt T1 F01))
			(trainInItinerary T1 IW3)
			(trainHasEnteredStation T1)
			(increase (trainsEnteredFromEndpoint W_plus) 1 )
			(binBitIsBlocked cdbaa)
			(binBitIsBlocked cdbac)
			(binBitIsBlocked cdbaf)
			(binBitIsBlocked cdbaj)
			(binBitIsBlocked cdbam)
			(binBitIsBlocked cdbar)
			(binBitIsBlocked cdbaw)
			(binBitIsBlocked cdbbb)
		)
	)
	(:action T1_entersStation_IW4
		:parameters()
		:precondition (and
			(trainIsAtEndpoint T1 W_plus)
			(not (trainHasExitedStation T1))
			(not (trainHasEnteredStation T1))
			(= (trainEntryIndex T1) (trainsEnteredFromEndpoint W_plus))
			(not (binBitIsBlocked cdbaa))
			(not (binBitIsBlocked cdbac))
			(not (binBitIsBlocked cdbag))
			(not (binBitIsBlocked cdbak))
			(not (binBitIsBlocked cdban))
			(not (binBitIsBlocked cdbas))
			(not (binBitIsBlocked cdbax))
			(not (binBitIsBlocked cdbbc))
		)
		:effect (and
			(not (trainIsAtEndpoint T1 W_plus))
			(itineraryIsReserved IW4)
			(not (trainEntersStationAt T1 F01))
			(trainInItinerary T1 IW4)
			(trainHasEnteredStation T1)
			(increase (trainsEnteredFromEndpoint W_plus) 1 )
			(binBitIsBlocked cdbaa)
			(binBitIsBlocked cdbac)
			(binBitIsBlocked cdbag)
			(binBitIsBlocked cdbak)
			(binBitIsBlocked cdban)
			(binBitIsBlocked cdbas)
			(binBitIsBlocked cdbax)
			(binBitIsBlocked cdbbc)
		)
	)
	(:action T1_entersStation_IW5
		:parameters()
		:precondition (and
			(trainIsAtEndpoint T1 W_plus)
			(not (trainHasExitedStation T1))
			(not (trainHasEnteredStation T1))
			(= (trainEntryIndex T1) (trainsEnteredFromEndpoint W_plus))
			(not (binBitIsBlocked cdbaa))
			(not (binBitIsBlocked cdbac))
			(not (binBitIsBlocked cdbag))
			(not (binBitIsBlocked cdbak))
			(not (binBitIsBlocked cdbao))
			(not (binBitIsBlocked cdbat))
			(not (binBitIsBlocked cdbay))
			(not (binBitIsBlocked cdbbd))
		)
		:effect (and
			(not (trainIsAtEndpoint T1 W_plus))
			(itineraryIsReserved IW5)
			(not (trainEntersStationAt T1 F01))
			(trainInItinerary T1 IW5)
			(trainHasEnteredStation T1)
			(increase (trainsEnteredFromEndpoint W_plus) 1 )
			(binBitIsBlocked cdbaa)
			(binBitIsBlocked cdbac)
			(binBitIsBlocked cdbag)
			(binBitIsBlocked cdbak)
			(binBitIsBlocked cdbao)
			(binBitIsBlocked cdbat)
			(binBitIsBlocked cdbay)
			(binBitIsBlocked cdbbd)
		)
	)
	(:event T1_completeItinerary_IW1
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW1) 5 )
			(itineraryIsReserved IW1)
			(trainInItinerary T1 IW1)
			(not (trainHasCompletedItinerary T1 IW1))
			(not (trainHasExitedStation T1))
		)
		:effect (and
			(trainHasCompletedItinerary T1 IW1)
		)
	)
	(:event T1_completeBinBit_IW1_cdbaa
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW1) 0 )
			(trainInItinerary T1 IW1)
			(binBitIsBlocked cdbaa)
		)
		:effect (and
			(not (binBitIsBlocked cdbaa))
		)
	)
	(:event T1_completeBinBit_IW1_cdbac
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW1) 1 )
			(trainInItinerary T1 IW1)
			(binBitIsBlocked cdbac)
		)
		:effect (and
			(not (binBitIsBlocked cdbac))
		)
	)
	(:event T1_completeBinBit_IW1_cdbaf
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW1) 2 )
			(trainInItinerary T1 IW1)
			(binBitIsBlocked cdbaf)
		)
		:effect (and
			(not (binBitIsBlocked cdbaf))
		)
	)
	(:event T1_completeBinBit_IW1_cdbai
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW1) 2 )
			(trainInItinerary T1 IW1)
			(binBitIsBlocked cdbai)
		)
		:effect (and
			(not (binBitIsBlocked cdbai))
		)
	)
	(:event T1_completeBinBit_IW1_cdbap
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW1) 3 )
			(trainInItinerary T1 IW1)
			(binBitIsBlocked cdbap)
		)
		:effect (and
			(not (binBitIsBlocked cdbap))
		)
	)
	(:event T1_completeBinBit_IW1_cdbau
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW1) 4 )
			(trainInItinerary T1 IW1)
			(binBitIsBlocked cdbau)
		)
		:effect (and
			(not (binBitIsBlocked cdbau))
		)
	)
	(:action T1_beginStop_IW1_S_I
		:parameters()
		:precondition (and
			(trainHasCompletedItinerary T1 IW1)
			(trainInItinerary T1 IW1)
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
			(not (itineraryIsReserved IW1))
		)
	)
	(:event T1_endStop_IW1_S_I
		:parameters()
		:precondition (and
			(>= (trainStopTime T1) 1 )
			(trainInItinerary T1 IW1)
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
	(:action T1_trainEndsVoy_IW1_S_I
		:parameters()
		:precondition (and
			(trainInItinerary T1 IW1)
			(trainHasStopped T1)
			(trainHasStoppedAtStop T1 S_I)
			(not (trainHasEndedVoy T1))
		)
		:effect (and
			(not (trainInItinerary T1 IW1))
			(trainHasExitedStation T1)
			(trainHasEndedVoy T1)
			(assign (timeElapsedReservedItinerary IW1) 0 )
		)
	)
	(:event T1_completeItinerary_IW2
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW2) 5 )
			(itineraryIsReserved IW2)
			(trainInItinerary T1 IW2)
			(not (trainHasCompletedItinerary T1 IW2))
			(not (trainHasExitedStation T1))
		)
		:effect (and
			(trainHasCompletedItinerary T1 IW2)
		)
	)
	(:event T1_completeBinBit_IW2_cdbaa
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW2) 0 )
			(trainInItinerary T1 IW2)
			(binBitIsBlocked cdbaa)
		)
		:effect (and
			(not (binBitIsBlocked cdbaa))
		)
	)
	(:event T1_completeBinBit_IW2_cdbac
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW2) 1 )
			(trainInItinerary T1 IW2)
			(binBitIsBlocked cdbac)
		)
		:effect (and
			(not (binBitIsBlocked cdbac))
		)
	)
	(:event T1_completeBinBit_IW2_cdbaf
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW2) 1 )
			(trainInItinerary T1 IW2)
			(binBitIsBlocked cdbaf)
		)
		:effect (and
			(not (binBitIsBlocked cdbaf))
		)
	)
	(:event T1_completeBinBit_IW2_cdbaj
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW2) 2 )
			(trainInItinerary T1 IW2)
			(binBitIsBlocked cdbaj)
		)
		:effect (and
			(not (binBitIsBlocked cdbaj))
		)
	)
	(:event T1_completeBinBit_IW2_cdbal
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW2) 3 )
			(trainInItinerary T1 IW2)
			(binBitIsBlocked cdbal)
		)
		:effect (and
			(not (binBitIsBlocked cdbal))
		)
	)
	(:event T1_completeBinBit_IW2_cdbaq
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW2) 3 )
			(trainInItinerary T1 IW2)
			(binBitIsBlocked cdbaq)
		)
		:effect (and
			(not (binBitIsBlocked cdbaq))
		)
	)
	(:event T1_completeBinBit_IW2_cdbav
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW2) 4 )
			(trainInItinerary T1 IW2)
			(binBitIsBlocked cdbav)
		)
		:effect (and
			(not (binBitIsBlocked cdbav))
		)
	)
	(:action T1_beginStop_IW2_S_II
		:parameters()
		:precondition (and
			(trainHasCompletedItinerary T1 IW2)
			(trainInItinerary T1 IW2)
			(not (trainIsOverlapping T1))
			(not (stopIsOccupied S_II))
			(not (trainIsStopping T1))
			(not (trainHasStoppedAtStop T1 S_II))
		)
		:effect (and
			(trainIsStoppingAtStop T1 S_II)
			(trainIsStopping T1)
			(assign (trainStopTime T1) 0 )
			(stopIsOccupied S_II)
			(not (itineraryIsReserved IW2))
		)
	)
	(:event T1_endStop_IW2_S_II
		:parameters()
		:precondition (and
			(>= (trainStopTime T1) 1 )
			(trainInItinerary T1 IW2)
			(trainIsStoppingAtStop T1 S_II)
			(stopIsOccupied S_II)
		)
		:effect (and
			(assign (trainStopTime T1) 0 )
			(not (trainIsStoppingAtStop T1 S_II))
			(not (trainIsStopping T1))
			(trainHasStoppedAtStop T1 S_II)
			(trainHasStopped T1)
			(not (stopIsOccupied S_II))
		)
	)
	(:action T1_trainEndsVoy_IW2_S_II
		:parameters()
		:precondition (and
			(trainInItinerary T1 IW2)
			(trainHasStopped T1)
			(trainHasStoppedAtStop T1 S_II)
			(not (trainHasEndedVoy T1))
		)
		:effect (and
			(not (trainInItinerary T1 IW2))
			(trainHasExitedStation T1)
			(trainHasEndedVoy T1)
			(assign (timeElapsedReservedItinerary IW2) 0 )
		)
	)
	(:event T1_completeItinerary_IW3
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW3) 5 )
			(itineraryIsReserved IW3)
			(trainInItinerary T1 IW3)
			(not (trainHasCompletedItinerary T1 IW3))
			(not (trainHasExitedStation T1))
		)
		:effect (and
			(trainHasCompletedItinerary T1 IW3)
		)
	)
	(:event T1_completeBinBit_IW3_cdbaa
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW3) 0 )
			(trainInItinerary T1 IW3)
			(binBitIsBlocked cdbaa)
		)
		:effect (and
			(not (binBitIsBlocked cdbaa))
		)
	)
	(:event T1_completeBinBit_IW3_cdbac
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW3) 1 )
			(trainInItinerary T1 IW3)
			(binBitIsBlocked cdbac)
		)
		:effect (and
			(not (binBitIsBlocked cdbac))
		)
	)
	(:event T1_completeBinBit_IW3_cdbaf
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW3) 1 )
			(trainInItinerary T1 IW3)
			(binBitIsBlocked cdbaf)
		)
		:effect (and
			(not (binBitIsBlocked cdbaf))
		)
	)
	(:event T1_completeBinBit_IW3_cdbaj
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW3) 2 )
			(trainInItinerary T1 IW3)
			(binBitIsBlocked cdbaj)
		)
		:effect (and
			(not (binBitIsBlocked cdbaj))
		)
	)
	(:event T1_completeBinBit_IW3_cdbam
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW3) 3 )
			(trainInItinerary T1 IW3)
			(binBitIsBlocked cdbam)
		)
		:effect (and
			(not (binBitIsBlocked cdbam))
		)
	)
	(:event T1_completeBinBit_IW3_cdbar
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW3) 3 )
			(trainInItinerary T1 IW3)
			(binBitIsBlocked cdbar)
		)
		:effect (and
			(not (binBitIsBlocked cdbar))
		)
	)
	(:event T1_completeBinBit_IW3_cdbaw
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW3) 4 )
			(trainInItinerary T1 IW3)
			(binBitIsBlocked cdbaw)
		)
		:effect (and
			(not (binBitIsBlocked cdbaw))
		)
	)
	(:action T1_beginStop_IW3_S_III
		:parameters()
		:precondition (and
			(trainHasCompletedItinerary T1 IW3)
			(trainInItinerary T1 IW3)
			(not (trainIsOverlapping T1))
			(not (stopIsOccupied S_III))
			(not (trainIsStopping T1))
			(not (trainHasStoppedAtStop T1 S_III))
		)
		:effect (and
			(trainIsStoppingAtStop T1 S_III)
			(trainIsStopping T1)
			(assign (trainStopTime T1) 0 )
			(stopIsOccupied S_III)
			(not (itineraryIsReserved IW3))
		)
	)
	(:event T1_endStop_IW3_S_III
		:parameters()
		:precondition (and
			(>= (trainStopTime T1) 1 )
			(trainInItinerary T1 IW3)
			(trainIsStoppingAtStop T1 S_III)
			(stopIsOccupied S_III)
		)
		:effect (and
			(assign (trainStopTime T1) 0 )
			(not (trainIsStoppingAtStop T1 S_III))
			(not (trainIsStopping T1))
			(trainHasStoppedAtStop T1 S_III)
			(trainHasStopped T1)
			(not (stopIsOccupied S_III))
		)
	)
	(:action T1_trainEndsVoy_IW3_S_III
		:parameters()
		:precondition (and
			(trainInItinerary T1 IW3)
			(trainHasStopped T1)
			(trainHasStoppedAtStop T1 S_III)
			(not (trainHasEndedVoy T1))
		)
		:effect (and
			(not (trainInItinerary T1 IW3))
			(trainHasExitedStation T1)
			(trainHasEndedVoy T1)
			(assign (timeElapsedReservedItinerary IW3) 0 )
		)
	)
	(:event T1_completeItinerary_IW4
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW4) 5 )
			(itineraryIsReserved IW4)
			(trainInItinerary T1 IW4)
			(not (trainHasCompletedItinerary T1 IW4))
			(not (trainHasExitedStation T1))
		)
		:effect (and
			(trainHasCompletedItinerary T1 IW4)
		)
	)
	(:event T1_completeBinBit_IW4_cdbaa
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW4) 0 )
			(trainInItinerary T1 IW4)
			(binBitIsBlocked cdbaa)
		)
		:effect (and
			(not (binBitIsBlocked cdbaa))
		)
	)
	(:event T1_completeBinBit_IW4_cdbac
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW4) 1 )
			(trainInItinerary T1 IW4)
			(binBitIsBlocked cdbac)
		)
		:effect (and
			(not (binBitIsBlocked cdbac))
		)
	)
	(:event T1_completeBinBit_IW4_cdbag
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW4) 1 )
			(trainInItinerary T1 IW4)
			(binBitIsBlocked cdbag)
		)
		:effect (and
			(not (binBitIsBlocked cdbag))
		)
	)
	(:event T1_completeBinBit_IW4_cdbak
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW4) 2 )
			(trainInItinerary T1 IW4)
			(binBitIsBlocked cdbak)
		)
		:effect (and
			(not (binBitIsBlocked cdbak))
		)
	)
	(:event T1_completeBinBit_IW4_cdban
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW4) 3 )
			(trainInItinerary T1 IW4)
			(binBitIsBlocked cdban)
		)
		:effect (and
			(not (binBitIsBlocked cdban))
		)
	)
	(:event T1_completeBinBit_IW4_cdbas
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW4) 3 )
			(trainInItinerary T1 IW4)
			(binBitIsBlocked cdbas)
		)
		:effect (and
			(not (binBitIsBlocked cdbas))
		)
	)
	(:event T1_completeBinBit_IW4_cdbax
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW4) 4 )
			(trainInItinerary T1 IW4)
			(binBitIsBlocked cdbax)
		)
		:effect (and
			(not (binBitIsBlocked cdbax))
		)
	)
	(:action T1_beginStop_IW4_S_IV
		:parameters()
		:precondition (and
			(trainHasCompletedItinerary T1 IW4)
			(trainInItinerary T1 IW4)
			(not (trainIsOverlapping T1))
			(not (stopIsOccupied S_IV))
			(not (trainIsStopping T1))
			(not (trainHasStoppedAtStop T1 S_IV))
		)
		:effect (and
			(trainIsStoppingAtStop T1 S_IV)
			(trainIsStopping T1)
			(assign (trainStopTime T1) 0 )
			(stopIsOccupied S_IV)
			(not (itineraryIsReserved IW4))
		)
	)
	(:event T1_endStop_IW4_S_IV
		:parameters()
		:precondition (and
			(>= (trainStopTime T1) 1 )
			(trainInItinerary T1 IW4)
			(trainIsStoppingAtStop T1 S_IV)
			(stopIsOccupied S_IV)
		)
		:effect (and
			(assign (trainStopTime T1) 0 )
			(not (trainIsStoppingAtStop T1 S_IV))
			(not (trainIsStopping T1))
			(trainHasStoppedAtStop T1 S_IV)
			(trainHasStopped T1)
			(not (stopIsOccupied S_IV))
		)
	)
	(:action T1_trainEndsVoy_IW4_S_IV
		:parameters()
		:precondition (and
			(trainInItinerary T1 IW4)
			(trainHasStopped T1)
			(trainHasStoppedAtStop T1 S_IV)
			(not (trainHasEndedVoy T1))
		)
		:effect (and
			(not (trainInItinerary T1 IW4))
			(trainHasExitedStation T1)
			(trainHasEndedVoy T1)
			(assign (timeElapsedReservedItinerary IW4) 0 )
		)
	)
	(:event T1_completeItinerary_IW5
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW5) 5 )
			(itineraryIsReserved IW5)
			(trainInItinerary T1 IW5)
			(not (trainHasCompletedItinerary T1 IW5))
			(not (trainHasExitedStation T1))
		)
		:effect (and
			(trainHasCompletedItinerary T1 IW5)
		)
	)
	(:event T1_completeBinBit_IW5_cdbaa
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW5) 0 )
			(trainInItinerary T1 IW5)
			(binBitIsBlocked cdbaa)
		)
		:effect (and
			(not (binBitIsBlocked cdbaa))
		)
	)
	(:event T1_completeBinBit_IW5_cdbac
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW5) 1 )
			(trainInItinerary T1 IW5)
			(binBitIsBlocked cdbac)
		)
		:effect (and
			(not (binBitIsBlocked cdbac))
		)
	)
	(:event T1_completeBinBit_IW5_cdbag
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW5) 1 )
			(trainInItinerary T1 IW5)
			(binBitIsBlocked cdbag)
		)
		:effect (and
			(not (binBitIsBlocked cdbag))
		)
	)
	(:event T1_completeBinBit_IW5_cdbak
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW5) 2 )
			(trainInItinerary T1 IW5)
			(binBitIsBlocked cdbak)
		)
		:effect (and
			(not (binBitIsBlocked cdbak))
		)
	)
	(:event T1_completeBinBit_IW5_cdbao
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW5) 3 )
			(trainInItinerary T1 IW5)
			(binBitIsBlocked cdbao)
		)
		:effect (and
			(not (binBitIsBlocked cdbao))
		)
	)
	(:event T1_completeBinBit_IW5_cdbat
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW5) 3 )
			(trainInItinerary T1 IW5)
			(binBitIsBlocked cdbat)
		)
		:effect (and
			(not (binBitIsBlocked cdbat))
		)
	)
	(:event T1_completeBinBit_IW5_cdbay
		:parameters()
		:precondition (and
			(>= (timeElapsedReservedItinerary IW5) 4 )
			(trainInItinerary T1 IW5)
			(binBitIsBlocked cdbay)
		)
		:effect (and
			(not (binBitIsBlocked cdbay))
		)
	)
	(:action T1_beginStop_IW5_S_V
		:parameters()
		:precondition (and
			(trainHasCompletedItinerary T1 IW5)
			(trainInItinerary T1 IW5)
			(not (trainIsOverlapping T1))
			(not (stopIsOccupied S_V))
			(not (trainIsStopping T1))
			(not (trainHasStoppedAtStop T1 S_V))
		)
		:effect (and
			(trainIsStoppingAtStop T1 S_V)
			(trainIsStopping T1)
			(assign (trainStopTime T1) 0 )
			(stopIsOccupied S_V)
			(not (itineraryIsReserved IW5))
		)
	)
	(:event T1_endStop_IW5_S_V
		:parameters()
		:precondition (and
			(>= (trainStopTime T1) 1 )
			(trainInItinerary T1 IW5)
			(trainIsStoppingAtStop T1 S_V)
			(stopIsOccupied S_V)
		)
		:effect (and
			(assign (trainStopTime T1) 0 )
			(not (trainIsStoppingAtStop T1 S_V))
			(not (trainIsStopping T1))
			(trainHasStoppedAtStop T1 S_V)
			(trainHasStopped T1)
			(not (stopIsOccupied S_V))
		)
	)
	(:action T1_trainEndsVoy_IW5_S_V
		:parameters()
		:precondition (and
			(trainInItinerary T1 IW5)
			(trainHasStopped T1)
			(trainHasStoppedAtStop T1 S_V)
			(not (trainHasEndedVoy T1))
		)
		:effect (and
			(not (trainInItinerary T1 IW5))
			(trainHasExitedStation T1)
			(trainHasEndedVoy T1)
			(assign (timeElapsedReservedItinerary IW5) 0 )
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
			(increase time  #t )
		)
	)
)
