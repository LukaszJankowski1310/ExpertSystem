;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************


(defrule determine-FellLikeCele
   (logical (start))
   =>
   (assert (UI-state (display FeelLikeCelebratingQ)
                     (relation-asserted FellLikeCele)
                     (response Yes)
                     (valid-answers Yes No))))


(defrule determine-Ghosts
  (logical (FellLikeCele No))
  =>
   (assert (UI-state (display GhostsQ)
                       (relation-asserted Ghosts)
                       (response Yes)
                       (valid-answers Yes No))))

                     
(defrule determine-IntenseCompetition

   (or
   (logical (FellLikeCele Yes))
   (logical (Ghosts Yes))
   )
   =>
   (assert (UI-state (display IntenseCompetitionQ)
                     (relation-asserted IntenseCompetition)
                     (response PeaceAndLoveAns)
                     (valid-answers PeaceAndLoveAns PerfectTimeAns))))
   

(defrule determine-StuffyOld
  (logical (IntenseCompetition PeaceAndLoveAns))
  =>
   (assert (UI-state (display StuffyOldQ)
                     (relation-asserted StuffyOld)
                     (response NewHolyAns)
                     (valid-answers NewHolyAns ClassicAns))))


(defrule determine-ToTheDeath
  (logical (IntenseCompetition PerfectTimeAns))
  =>
   (assert (UI-state (display ToTheDeathQ)
                       (relation-asserted ToTheDeath)
                       (response FinishHimAns)
                       (valid-answers FinishHimAns HurtFeelingsAns))))


(defrule determine-AstronomicalEvent
   (logical (StuffyOld ClassicAns))
    =>
    (assert (UI-state (display AstronomicalEventQ)
                      (relation-asserted AstronomicalEvent)
                      (response TrueAns)
                      (valid-answers TrueAns FalseAns))))


(defrule determine-CelebrateAmbivalence
 (logical (StuffyOld NewHolyAns))
 =>
   (assert (UI-state (display CelebrateAmbivalenceQ)
                       (relation-asserted CelebrateAmbivalence)
                       (response AARootsAns)
                       (valid-answers AARootsAns ApathyIndiffAns))))

(defrule determine-CaptainKirk
 (logical (AstronomicalEvent FalseAns))
 =>
   (assert (UI-state (display CaptainKirkQ)
                       (relation-asserted CaptainKirk)
                       (response CircusClownAns)
                       (valid-answers CircusClownAns ToyAns))))

(defrule determine-LongDarkCorridor
 (or
  (logical (CaptainKirk CircusClownAns))
  (logical (CandlesSpinningTops MehAns))
  (logical (TwistAndTurns KeepGoingAns))
 )
 =>
  (assert (UI-state (display LongDarkCorridorQ)
                    (relation-asserted LongDarkCorridor)
                    (response LeftDownAns)
                    (valid-answers LeftDownAns RightDoorAns))))


(defrule determine-OldGrinch
  (logical (Ghosts No))
    =>
  (assert (UI-state (display OldGrinchQ)
                    (relation-asserted OldGrinch)
                    (response WrongKidsAns)
                    (valid-answers WrongKidsAns DontFellCeleAns))))


(defrule determine-AiringOfGrievances
  (logical (OldGrinch WrongKidsAns))
  =>

  (assert (UI-state (display AiringOfGrievancesQ)
                    (relation-asserted AiringOfGrievances)
                    (response LotOfProblemsAns)
                    (valid-answers LotOfProblemsAns DontCelebratingAns))))

(defrule determine-Earth
  (logical (CaptainKirk ToyAns))
  =>

  (assert (UI-state (display EarthQ)
                    (relation-asserted Earth)
                    (response EarthHoliFineAns)
                    (valid-answers EarthHoliFineAns GmotRockAns))))

(defrule determine-ChewbaccaMrWorf
  (logical (Earth GmotRockAns))
  =>

  (assert (UI-state (display ChewbaccaMrWorfQ)
                    (relation-asserted ChewbaccaMrWorf)
                    (response WookieeWinAns)
                    (valid-answers WookieeWinAns MrWorfAns))))


(defrule determine-CandlesSpinningTops
  (logical (Earth EarthHoliFineAns))
  =>

  (assert (UI-state (display CandlesSpinningTopsQ)
                    (relation-asserted CandlesSpinningTops)
                    (response MehAns)
                    (valid-answers MehAns HdyKnowAns))))


(defrule determine-ForceThroughDoor
  (logical (LongDarkCorridor RightDoorAns))
  =>

  (assert (UI-state (display ForceThroughDoorQ)
                    (relation-asserted ForceThroughDoor)
                    (response JoinPartyAns)
                    (valid-answers JoinPartyAns ContThoughDoorAns))))


(defrule determine-BoxOrBell
  (logical (LongDarkCorridor LeftDownAns))
  =>

  (assert (UI-state (display BoxOrBellQ)
                    (relation-asserted BoxOrBell)
                    (response BoxAns)
                    (valid-answers BoxAns RingAns))))


(defrule determine-EvaluateProgress
  (logical (BoxOrBell RingAns))
  =>

  (assert (UI-state (display EvaluateProgressQ)
                    (relation-asserted EvaluateProgress)
                    (response SelfDoubtAns)
                    (valid-answers SelfDoubtAns EtAccorPlanAns))))


(defrule determine-Box
  (logical (BoxOrBell BoxAns))
  =>

  (assert (UI-state (display BoxQ)
                    (relation-asserted Box)
                    (response NothingAns)
                    (valid-answers NothingAns PresentsAns))))


(defrule determine-TwistAndTurns
  (logical (ForceThroughDoor ContThoughDoorAns))
  =>

  (assert (UI-state (display TwistAndTurnsQ)
                    (relation-asserted TwistAndTurns)
                    (response KeepGoingAns)
                    (valid-answers KeepGoingAns GiveUpAns))))

(defrule determine-Roof
  (logical (EvaluateProgress EtAccorPlanAns))
  =>

  (assert (UI-state (display RoofQ)
                    (relation-asserted Roof)
                    (response FiddlerAns)
                    (valid-answers FiddlerAns JingleBellsAns))))


(defrule determine-Song
  (logical (Roof FiddlerAns))
  =>

  (assert (UI-state (display SongQ)
                    (relation-asserted Song)
                    (response HavaNagilaAns)
                    (valid-answers HavaNagilaAns SilentNight))))


;;;*************************
;;;* FINAL ANSWERS *
;;;*************************


(defrule Solstice
   (logical (AstronomicalEvent TrueAns))
   =>
   (assert (UI-state (display SolsticeFA)
                     (state final))))

(defrule Festivus
 (or
   (logical (ToTheDeath HurtFeelingsAns))
   (logical (AiringOfGrievances LotOfProblemsAns))
   (logical (CelebrateAmbivalence ApathyIndiffAns))
 )
 =>
 (assert (UI-state (display FestivusFA)
                      (state final))))

(defrule NoHoloday
   (or
   (logical (OldGrinch DontFellCeleAns))
   (logical (AiringOfGrievances DontCelebratingAns))
   )

 =>
 (assert (UI-state (display NoHolodayFA)
                      (state final))))

(defrule Kwanzaa
  (logical (CelebrateAmbivalence AARootsAns))
  =>
  (assert (UI-state (display KwanzaaFA)
                        (state final))))

(defrule Klingon
   (or
   (logical (ToTheDeath FinishHimAns))
   (logical (ChewbaccaMrWorf MrWorfAns))
   )
   =>
   (assert (UI-state (display KlingonFA)
                         (state final))))

(defrule LifeDay
  (logical (ChewbaccaMrWorf WookieeWinAns))
  =>
  (assert (UI-state (display LifeDayFA)
                        (state final))))


(defrule Christmas
  (or
   (logical (Box PresentsAns))
   (logical (Roof JingleBellsAns))
   (logical (Song SilentNight))
  )
  =>
  (assert (UI-state (display ChristmasFA)
                        (state final))))

(defrule BoxingDay

   (logical (Box NothingAns))

  =>
  (assert (UI-state (display BoxingDayFA)
                        (state final))))

(defrule NewYearsDay
  (or
   (logical (EvaluateProgress SelfDoubtAns))
   (logical (ForceThroughDoor JoinPartyAns))
  )
  =>
  (assert (UI-state (display NewYearsDayFA)
                        (state final))))


(defrule Hanukkah
  (or
   (logical (CandlesSpinningTops HdyKnowAns))
   (logical (Song HavaNagilaAns))
  )
  =>
  (assert (UI-state (display HanukkahFA)
                        (state final))))


(defrule Robanukah

   (logical (TwistAndTurns GiveUpAns))

  =>
  (assert (UI-state (display RobanukahFA)
                        (state final))))

;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
