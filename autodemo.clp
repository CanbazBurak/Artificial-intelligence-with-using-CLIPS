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
                    (relation-asserted first)
                    (state initial)
                    (valid-answers))))





;;;***************
;;;* QUERY RULES *
;;;***************


(defrule determine-lovemoney ""

   (logical (first))

   =>

   (assert (UI-state (display StartQuestion)
                     (relation-asserted lovemoney)
                     (response No)
                     (valid-answers No Yes))))
                     
 (defrule determine-productive ""

   (logical (lovemoney Yes))

   =>

   (assert (UI-state (display ProductiveWorkQuestion)
                     (relation-asserted productivework )
                     (response No)
                     (valid-answers No Yes))))
                     

  (defrule determine-code ""

   (logical (productivework Yes))

   =>

   (assert (UI-state (display CodeQuestion)
                     (relation-asserted code)
                     (response No)
                     (valid-answers No Maybe Yes))))
  
  (defrule determine-responsibility ""

   (logical (productivework No))

   =>

   (assert (UI-state (display ResponsibilityQuestion)
                     (relation-asserted responsibility )
                     (response No)
                     (valid-answers No Yes))))
                     
  (defrule determine-grandvision ""

   (logical (responsibility No))

   =>

   (assert (UI-state (display GrandVisionQuestion)
                     (relation-asserted grandvision )
                     (response No)
                     (valid-answers No Yes))))
 
  (defrule determine-HaveMoney ""

   (logical (grandvision No))

   =>

   (assert (UI-state (display HavemoneyQuestion)
                     (relation-asserted HaveMoney )
                     (response No)
                     (valid-answers No Yes)))) 


  (defrule determine-Conscience ""

   (logical (HaveMoney Yes))

   =>

   (assert (UI-state (display ConscienceQuestion)
                     (relation-asserted Conscience )
                     (response No)
                     (valid-answers No Yes))))
                     
  (defrule determine-ExceptionalTalent ""

   (logical (lovemoney No))

   =>

   (assert (UI-state (display TalentQuestion)
                     (relation-asserted ExceptionalTalent )
                     (response No)
                     (valid-answers No Yes))))                   
                                       
  (defrule determine-Bitter ""

   (logical (ExceptionalTalent No))

   =>

   (assert (UI-state (display BitterQuestion)
                     (relation-asserted Bitter )
                     (response No)
                     (valid-answers No Yes)))) 
                     
                     
 (defrule determine-PeopleIdeas ""

   (logical (ExceptionalTalent Yes))

   =>

   (assert (UI-state (display IdeasQuestion)
                     (relation-asserted PeopleIdeas )
                     (response No)
                     (valid-answers No Yes)))) 
                     
                     
(defrule determine-PeopleIdeas ""

   (logical (ExceptionalTalent Yes))

   =>

   (assert (UI-state (display IdeasQuestion)
                     (relation-asserted PeopleIdeas )
                     (response No)
                     (valid-answers No Maybe Yes))))                                             
                     
 (defrule determine-Really ""

   (logical (PeopleIdeas Yes))

   =>

   (assert (UI-state (display ReallyQuestion)
                     (relation-asserted Really )
                     (response No)
                     (valid-answers No Yes))))                 
                     
 (defrule determine-GameImportant ""

   (or(logical (PeopleIdeas No))
   		(logical(Really No)))

   =>

   (assert (UI-state (display GameImportantQuestion)
                     (relation-asserted GameImportant )
                     (response No)
                     (valid-answers No Yes))))  
                     
 (defrule determine-MakeGame ""

   (logical (GameImportant Yes))

   =>

   (assert (UI-state (display MakeGameQuestion)
                     (relation-asserted MakeGame )
                     (response No)
                     (valid-answers No Yes)))) 
  
  
 (defrule determine-BasicGrammer ""

   (logical (MakeGame No))

   =>

   (assert (UI-state (display BasicGrammerQuestion)
                     (relation-asserted BasicGrammer )
                     (response No)
                     (valid-answers No Yes))))  
                     
                     
 (defrule determine-PlayingGame ""

   (logical (BasicGrammer No))

   =>

   (assert (UI-state (display PlayingGameQuestion)
                     (relation-asserted PlayingGame )
                     (response No)
                     (valid-answers No Yes)))) 
                     
                     
  (defrule determine-FromAsia ""

   (logical (PlayingGame Yes))

   =>

   (assert (UI-state (display FromAsiaQuestion)
                     (relation-asserted FromAsia )
       				 (response No)
                     (valid-answers Yes,Korea No Yes,China))))                     
                                         
                     
  (defrule determine-MindUnder ""

   (logical (Really Yes))

   =>

   (assert (UI-state (display MindUnderQuestion)
                     (relation-asserted MindUnder )
                     (response No)
                     (valid-answers No Yes))))
                     
                     
   (defrule determine-VisualOriented ""

   (logical (MindUnder Yes))

   =>

   (assert (UI-state (display VisualOrientedQuestion)
                     (relation-asserted VisualOriented )
                     (response No)
                     (valid-answers No Yes))))                      
                     
  
  
   (defrule determine-WorkingOverTalking ""

   (logical (VisualOriented Yes))

   =>

   (assert (UI-state (display WorkingOverTalkingQuestion)
                     (relation-asserted WorkingOverTalking )
                     (response No)
                     (valid-answers No Yes))))                    
                     
                     
     (defrule determine-ProperArtist ""

   (logical (WorkingOverTalking Yes))

   =>

   (assert (UI-state (display ProperArtistQuestion)
                     (relation-asserted ProperArtist )
                     (response No)
                     (valid-answers No Yes))))                     
                     
                     
(defrule determine-WantToSpend ""

   (logical (ProperArtist No))

   =>

   (assert (UI-state (display WantToSpendQuestion)
                     (relation-asserted WantToSpend )
                     (response No)
                     (valid-answers No Yes))))                     
                                          
                     
  (defrule determine-French ""

   (logical (ProperArtist Yes))

   =>

   (assert (UI-state (display FrenchQuestion)
                     (relation-asserted French )
                     (response No)
                     (valid-answers No Yes))))                      
                     
                     
 (defrule determine-Asian ""

   (logical (French No))

   =>

   (assert (UI-state (display AsianQuestion)
                     (relation-asserted Asian )
                     (response No)
                     (valid-answers No Yes))))                     
                     
                     
  (defrule determine-Crafting ""

   (logical (Asian No))

   =>

   (assert (UI-state (display CraftingQuestion)
                     (relation-asserted Crafting )
                     (response No)
                     (valid-answers No Yes))))                     
                     
 (defrule determine-UnfinishedTools ""

   (logical (VisualOriented No))

   =>

   (assert (UI-state (display UnfinishedToolsQuestion)
                     (relation-asserted UnfinishedTools )
                     (response No)
                     (valid-answers No Yes))))                      
                     
                     
 (defrule determine-Spreadsheet ""

   (logical (UnfinishedTools No))

   =>

   (assert (UI-state (display SpreadsheetQuestion)
                     (relation-asserted Spreadsheet )
                     (response No)
                     (valid-answers No Yes))))                      
                     
 (defrule determine-WhatToDo ""

   (logical (Spreadsheet Yes))

   =>

   (assert (UI-state (display WhatToDoQuestion)
                     (relation-asserted WhatToDo )
                     (response No)
                     (valid-answers No Yes))))                    
                     
                     
  (defrule determine-TiniestDetail ""

   (logical (WhatToDo Yes))

   =>

   (assert (UI-state (display TiniestDetailQuestion)
                     (relation-asserted TiniestDetail )
                     (response No)
                     (valid-answers No Yes))))                     
                     
                     
  (defrule determine-Fixiation ""

   (logical (WhatToDo Yes))

   =>

   (assert (UI-state (display FixiationQuestion)
                     (relation-asserted Fixiation )
                     (response No)
                     (valid-answers No Yes))))                    
                     
                     
                     
   (defrule determine-BeAlone ""

   (logical (MindUnder No))

   =>

   (assert (UI-state (display BeAloneQuestion)
                     (relation-asserted BeAlone )
                     (response No)
                     (valid-answers No Yes))))                   
                     
                     
 (defrule determine-Musically ""

   (logical (BeAlone Yes))

   =>

   (assert (UI-state (display MusicallyQuestion)
                     (relation-asserted Musically )
                     (response No)
                     (valid-answers No Yes))))                     
                     
                     
  (defrule determine-ThingsUp ""

   (logical (Musically Yes))

   =>

   (assert (UI-state (display ThingsUpQuestion)
                     (relation-asserted ThingsUp )
                     (response No)
                     (valid-answers No Yes))))                   
                     
                     
                     
  (defrule determine-BeInMovies ""

   (logical (BeAlone No))

   =>

   (assert (UI-state (display BeInMoviesQuestion)
                     (relation-asserted BeInMovies )
                     (response No)
                     (valid-answers No Yes))))                     
                     
    (defrule determine-TVorMovie ""

   (logical (BeInMovies Yes))

   =>

   (assert (UI-state (display TVorMovieQuestion)
                     (relation-asserted TVorMovie )
                     (response No)
                     (valid-answers No Yes))))                    
                     
  (defrule determine-YoungCaucasian ""

   (logical (TVorMovie No))

   =>

   (assert (UI-state (display YoungCaucasianQuestion)
                     (relation-asserted YoungCaucasian )
                     (response No)
                     (valid-answers No Yes))))                     
                     
                     
 (defrule determine-Male ""

   (logical (YoungCaucasian Yes))

   =>

   (assert (UI-state (display MaleQuestion)
                     (relation-asserted Male )
                     (response No)
                     (valid-answers No Yes))))                    
                     
                     
(defrule determine-ArtsAndCrafts ""

   (logical (Male No))

   =>

   (assert (UI-state (display ArtsAndCraftsQuestion)
                     (relation-asserted ArtsAndCrafts )
                     (response No)
                     (valid-answers No Yes))))                   
                     
                     
                     
 (defrule determine-ErrorGraph ""

   (logical (BeInMovies No))

   =>

   (assert (UI-state (display ErrorGraphQuestion)
                     (relation-asserted ErrorGraph )
                     (response No)
                     (valid-answers No Yes))))                     
                     
                     
   (defrule determine-WhoToHangOut ""

   (logical (ErrorGraph No))

   =>

   (assert (UI-state (display WhoToHangOutQuestion)
                     (relation-asserted WhoToHangOut )
                     (response No)
                     (valid-answers No Yes))))                   
                     
                     
 

;;;****************
;;;*   RESULT     *
;;;****************


(defrule right-code-conclusion ""

   (logical (code Yes))
   
   =>

   (assert (UI-state (display YesCode)
                     (state final))))
                     
                     
                     
  (defrule maybe-code-conclusion ""

   (logical (code Maybe))
   
   =>

   (assert (UI-state (display MaybeCode)
                     (state final))))
                     
                     
 (defrule wrong-code-conclusion ""

   (logical (code No))
   
   =>

   (assert (UI-state (display NoCode)
                     (state final))))

 
 (defrule rihgt-responsibility-conclusion ""

   (logical (responsibility Yes))
   
   =>

   (assert (UI-state (display yesResponsibility)
                     (state final))))

 (defrule rihgt-grandvision-conclusion ""

   (logical (grandvision Yes))
   
   =>

   (assert (UI-state (display yesgrandvision)
                     (state final))))

 (defrule wrong-HaveMoney-conclusion ""

   (logical (HaveMoney No))
   
   =>

   (assert (UI-state (display noHaveMoney)
                     (state final))))


 (defrule wrong-Conscience-conclusion ""

   (logical (Conscience No))
   
   =>

   (assert (UI-state (display noConscience)
                     (state final))))


 (defrule right-Conscience-conclusion ""

   (logical (Conscience Yes))
   
   =>

   (assert (UI-state (display yesConscience)
                     (state final))))





(defrule wrong-Bitter-conclusion ""

   (logical (Bitter No))
   
   =>

   (assert (UI-state (display noBitter)
                     (state final))))


 (defrule right-Bitter-conclusion ""

   (logical (Bitter Yes))
   
   =>

   (assert (UI-state (display yesBitter)
                     (state final))))


(defrule maybe-PeopleIdeas-conclusion ""

   (logical (PeopleIdeas Maybe))
   
   =>

   (assert (UI-state (display MaybePeopleIdeas)
                     (state final))))



(defrule wrong-GameImportant-conclusion ""

   (logical (GameImportant No))
   
   =>

   (assert (UI-state (display noGameImportant)
                     (state final))))


(defrule right-MakeGame-conclusion ""

   (logical (MakeGame Yes))
   
   =>

   (assert (UI-state (display yesMakeGame)
                     (state final))))




(defrule right-BasicGrammer-conclusion ""

   (logical (BasicGrammer Yes))
   
   =>

   (assert (UI-state (display yesBasicGrammer)
                     (state final))))



(defrule right-FromAsia-conclusion ""

   (logical (FromAsia Yes,Korea))
   
   =>

   (assert (UI-state (display KoreaState)
                     (state final))))
                     
                     
                     
                     
(defrule wrong-FromAsia-conclusion ""

   (logical (FromAsia No))
   
   =>

   (assert (UI-state (display noAsia)
                     (state final))))
 
 
(defrule correct-FromAsia-conclusion ""

   (logical (FromAsia Yes,China))
   
   =>

   (assert (UI-state (display ChinaState)
                     (state final))))



(defrule wrong-Musically-conclusion ""

   (logical (Musically No))
   
   =>

   (assert (UI-state (display noMusically)
                     (state final))))



(defrule wrong-ThingsUp-conclusion ""

   (logical (ThingsUp No))
   
   =>

   (assert (UI-state (display noThingsUp)
                     (state final))))

(defrule right-ThingsUp-conclusion ""

   (logical (ThingsUp Yes))
   
   =>

   (assert (UI-state (display yesThingsUp)
                     (state final))))
                     
                     
                     
 (defrule right-TVorMovie-conclusion ""

   (logical (TVorMovie Yes))
   
   =>

   (assert (UI-state (display yesTVorMovie)
                     (state final))))
                                     
                     
            
(defrule right-WhoToHangOut-conclusion ""

   (logical (WhoToHangOut Yes))
   
   =>

   (assert (UI-state (display yesWhoToHangOut)
                     (state final))))

(defrule wrong-WhoToHangOut-conclusion ""

   (logical (WhoToHangOut No))
   
   =>

   (assert (UI-state (display noWhoToHangOut)
                     (state final))))




(defrule right-ErrorGraph-conclusion ""

   (logical (ErrorGraph Yes))
   
   =>

   (assert (UI-state (display yesErrorGraph)
                     (state final))))



(defrule right-ArtsAndCrafts-conclusion ""

   (logical (ArtsAndCrafts Yes))
   
   =>

   (assert (UI-state (display yesArtsAndCrafts)
                     (state final))))



(defrule wrong-ArtsAndCrafts-conclusion ""

   (logical (ArtsAndCrafts No))
   
   =>

   (assert (UI-state (display noArtsAndCrafts)
                     (state final))))





(defrule right-Male-conclusion ""

   (logical (Male Yes))
   
   =>

   (assert (UI-state (display yesMale)
                     (state final))))



(defrule wrong-YoungCaucasian-conclusion ""

   (logical (YoungCaucasian No))
   
   =>

   (assert (UI-state (display noYoungCaucasian)
                     (state final))))




(defrule wrong-WorkingOverTalking-conclusion ""

   (logical (WorkingOverTalking No))
   
   =>

   (assert (UI-state (display noWorkingOverTalking)
                     (state final))))





(defrule right-Fixiation-conclusion ""

   (logical (Fixiation Yes))
   
   =>

   (assert (UI-state (display yesFixiation)
                     (state final))))



(defrule wrong-Fixiation-conclusion ""

   (logical (Fixiation No))
   
   =>

   (assert (UI-state (display noFixiation)
                     (state final))))




(defrule right-Crafting-conclusion ""

   (logical (Crafting Yes))
   
   =>

   (assert (UI-state (display yesCrafting)
                     (state final))))



(defrule wrong-Crafting-conclusion ""

   (logical (Crafting No))
   
   =>

   (assert (UI-state (display noCrafting)
                     (state final))))


(defrule right-French-conclusion ""

   (logical (French Yes))
   
   =>

   (assert (UI-state (display yesFrench)
                     (state final))))



(defrule right-Asian-conclusion ""

   (logical (Asian Yes))
   
   =>

   (assert (UI-state (display yesAsian)
                     (state final))))




(defrule right-UnfinishedTools-conclusion ""

   (logical (UnfinishedTools Yes))
   
   =>

   (assert (UI-state (display yesUnfinishedTools)
                     (state final))))





(defrule right-WantToSpend-conclusion ""

   (logical (WantToSpend Yes))
   
   =>

   (assert (UI-state (display yesWantToSpend)
                     (state final))))



(defrule wrong-WantToSpend-conclusion ""

   (logical (WantToSpend No))
   
   =>

   (assert (UI-state (display noWantToSpend)
                     (state final))))




(defrule wrong-WhatToDo-conclusion ""

   (logical (WhatToDo No))
   
   =>

   (assert (UI-state (display noWhatToDo)
                     (state final))))



(defrule wrong-TiniestDetail-conclusion ""

   (logical (TiniestDetail No))
   
   =>

   (assert (UI-state (display noTiniestDetail)
                     (state final))))



(defrule wrong-Spreadsheet-conclusion ""

   (logical (Spreadsheet No))
   
   =>

   (assert (UI-state (display noSpreadsheet)
                     (state final))))




(defrule wrong-PlayingGame-conclusion ""

   (logical (PlayingGame No))
   
   =>

   (assert (UI-state (display noAsia)
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
   
