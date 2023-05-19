VAR distance_between_lake =200
VAR awareness = 0
VAR been_in_forest = 0
VAR peck = 0

-> introduction

=== introduction
    It is summer time. The forest carpet is covered with blooming flowers of various colorful colors: electric purple, swavy green, petrifying red and feverish blue. The atmosphere is filled with butterflys and hummingbirds as far as the eye can see, and the ground has no shortage of bunnies, porcupines and mice.
    However, as always, there are only 2 things on your mind: food and water. You see a lake nearby and hear a wolf's howl deep into the forest. What do you do?
        * [Go towards the lake]
        -> the_lake

        * [Go deeper into the forest]
        -> the_deep_forest
            
-> END

=== the_lake
    As you approach the lake you feel a mysterious aura in the air. The colors around you seem to change and the forest seems to have turned down it's volume. Despite all this you feel calm, something that you have not felt for a long time. That, coupled with your insatiable thirst makes it impossible for you to go anywhere else but forward.
    
        ->the_lake.going_towards_the_lake
        
    
    = going_towards_the_lake
        + [Go closer to the lake]
                    
            ~ distance_between_lake = distance_between_lake - 50
            
            {
                - distance_between_lake>149 && distance_between_lake<200:
                You are surrounded with dark green and red colors. You can hear the faint chirping of birds as well as the sounds of leaves beneath you as you walk through them.
                
                - distance_between_lake>99 && distance_between_lake<150:
                The green colors seemed to have transformed into black. The red colors are still there. The chirping of birds are now intangible.
                
                - distance_between_lake > 49 && distance_between_lake < 100:
                Different shades of red is all you see now. You cannot even hear the sounds of yourself making your way towards the lake.
                
                - distance_between_lake > -1 && distance_between_lake < 50:
                The forest is now unrecognizable. It looks as if it has been devoured by the sun. The faintest sound cannot be heard, you have never experienced such silence. However, you have finally reached the lake. Now what?
                    * [Drink from the lake]
                    ->drink_from_the_lake
                    * [Jump in]
                    ->jump_into_the_lake
            }
            
            {
                -distance_between_lake>49:
                ->the_lake.going_towards_the_lake
            }
    
    =drink_from_the_lake
        You must have stared at the water for at least an hour before snapping out of your dream-like state and realizing why you came to the lake in the first place. You take a step forward and bend your head to take a sip. The bird on the other side of the water did not startle you this time. Somehow you realize that's your reflection, somehow being in the proximity of this lake has made you somewhat self-aware. 
        ~ awareness = awareness + 20
        After satisfying your thirst you suddently feel drawn towards something. You don't know what it is but you know the direction of it. At the same time, it hasn't rained in a while, your wings are all dirty and the gloomy crimson water seems like a nice place for a bath...
            * [Listen to your instinct and fly out of the forest]
            ->fly_out_of_forest
            * [Jump into the lake]
            ->jump_into_the_lake
    -> END
    =jump_into_the_lake
        You feel hypnotized. The beautiful red colors, the alluring water with it's dazzling reflection and calm yet mystifying tone. You take one step back and then dive head first. A spark goes through you as soon as you touch the river's surface. The water is warm, yet cold. Your body is relaxed, too relaxed to be able to move. Yet your mind is on fire. You see yourself in a nest, without any feathers, waiting for food to come. You see yourself flying away as your mother is fighting an eagle. You see yourself looking for shelter as rain is hurtling down on you at a painful rate. Memories that seem to have been long forgotten are bubbling up to the surface. You look up and notice that the water seems to be getting more and more opaque. The transparency of it is turning into muddied redness. As you go deeper your eyes become drowsy and fatigued. You cannot hold them open any longer, so you close them. Yet, before doing so, at the very last second, you see a familiar face. A human girl. Who is she and why does she look so familiar?
-> END

=== the_deep_forest
    {
    - awareness == 0:
    The howling scares you. You're not even sure why you started going, it seems like a terrible idea. All of your instincts tell you to go back, away from the danger, not towards it! 
    - else:
    You feel worried, but why? Nothing has happened to you and you're not in any danger. Out of nowhere a strange sound appeared in your head, "empathy". You're not sure how it came to be but now you suddently understand what you are experiencing.
    ~ awareness = awareness + 20
    }
    
     {
    - been_in_forest == 1:
    As you approach the wolf you get the sensation that you've been here before. This is indeed the very same wolf you went to previously. It seems delighted to see you again and starts making the very same paw gestures.
    - else:
     As you move in the direction of the wolf the forest becomes more and more spine-chilling. Something that was once lush and colorful is now unwelcoming, with barren trees and spiky bushes. Under a particularly desolate log you see the wolf. It seems to be making strange gestures with it's paws...
        ~ been_in_forest = 1
    }
    
    {
    - awareness ==0:
    You heart feels like it is about to burst out of your chest. All of this stress is making your thirst quenchless. Your fearful nature does not allow you to proceed any futher, so you decide to go back and head towards the lake.
    ->the_lake
    - else:
        These gestures that might have previously scared you, you now understand are directions. The wolf is trying to guide your attention towards a crack in the log that it is under. It seems like with enough pecking it might be possible to crack the log in half, giving the wolf room to escape. But should you help it?
            * [Help the wolf]
            ->help_wolf
            * [Fly away, towards what you were previously drawn to]
            Your priority right now should not be to help a feeble animal.
            -> fly_out_of_forest.fly_towards_house
    }
    =help_wolf
    What kind of heartless, inconsiderate and insensitive bird would leave this wolf to fend for itself after seeing the state that it is in? Without hesitation you begin pecking at the log.
        -> peck_log
    
    =peck_log
    +[Peck]
    ~peck = peck + 1
    {
    - peck == 1:
    The log is dense and rigid
    ->peck_log    
    - peck == 2:
    The log is a little more loose
    ->peck_log
    - peck == 3:
    The log looks like it is about to fall in half, almost there!
    -> peck_log
    - peck == 4:
    The log breaks in half, releasing the wolf from it's clutch. You feel a sense of triumph before realizing you've just freed a potentially hungry wolf. As you prepare to make your escape you notice that it bowed it's head, as if to thank you. This is a most unusual gesture for a wolf, could it have taken a sip or two from the same lake you've just come from? Unsure how to respond you bow your head as well, yet when you raise it back up the wolf is nowhere to be seen. Anyhow, it is now time to resume your journey.
        ~awareness = awareness + 20
        ->fly_out_of_forest.fly_towards_house
    }
-> END

=== fly_out_of_forest
    For the first time in your life you decide to go somewhere not for food, water or to escape danger. In fact you're not even sure why you made this decision or where you're even going, but you hope everything will make sense once you get there. You jump up and start flying higher and higher, until the lake is nothing but a dot in the distance. As you're gliding through the air you become lost in thought, questioning some of the decisions that you've made throughout your life. Instead of always looking for berries why has it never occurred to you to plant some seeds in the soil near your nest? Wait, how do you know that berries grow from seeds? Suddently you hear a howling wolf, possibly the same one you heard before, yet this time, to you, the howl sounds more like a cry for help. You start feeling things that you have never felt before, you don't understand them and for some reason you feel the need to go help the poor animal. For some reason, this time, the howl does not scare you.
        * [Continue flying]
        Your priority right now should not be to help a feeble animal.
        ->fly_towards_house
        * [Go towards the howl]
        -> the_deep_forest
        
    = fly_towards_house
   Drinking from a mysterious lake has given you peculiar thoughts and emotions, it feels like you have been sleeping your whole life and have just now awoken. As if this was not enough you are also drawn towards a mysterious location. Maybe going to this location will clear some things up for you? 
   After a few hours of flying strange thoughts start to emerge. Thoughts of a human girl playing, dancing and then...sinking...
   You don't pay much attention to these as over the horizon a two-story house emerges. Despite never coming to this part of the land it looks oddly familiar and nostalgic. You stop nearby and examine it for 10 minutes, trying to figure out where you've seen it before. Perhaps when you were younger?
   {
   - awareness == 20:
   Suddently, a man comes out of the house, holding what looks to you like a metal tree branch. You don't recognize him but feel as though you two were previously close, before something terrible happened. 
      
   - awareness == 40:
   Suddently, a man comes out of the house, holding what looks to you like a metal tree branch. You don't really recognize him but get an immediate uneasy feeling. You know this man has done terrible things.
   - awareness == 60:
    Suddently, a man comes out of the house, holding what looks to you like a metal tree branch. You recognize him but unsure from where. You begin to feel sick in your stomach. Lightheadedness takes over, memories of water and not being able to breathe fill your head. This man has done something to you in the past, but what?
   }
     * [Approach the man]
    -> conflict
     * [Keep looking]
    -> conflict.avoid_conflict
-> END

=== conflict
    As you get closer and closer a shiver runs down your spine. Perhaps this is a bad idea? Perhaps you should leave and never return? The colors around you seem to shift and you don't seem to be able to turn back. Every step gives you a new dose of distress, anxiety and curiosity. Out of nowhere you hear an unanticipated sharp noise, before losing your balance and falling over. Your field of vision starts to turn red. This is just like the redness of the lake, you think. Except this time the lake is not the source of the color, and the liquid that you see is not water...
    ->END
    = avoid_conflict
    Approaching this man does not sound like a well thought out idea, so you continue to stare at him from afar. After locking the door he goes into the woods. You continue to stare until he has left your field of view, noticing shortly after that one of the windows has been left open. This is your chance to go inside and ,hopefully, get the answers you've been looking for.
    * [Enter the house]
    -> enter_house
    * [Continue looking]
    -> continue_staring
    = enter_house
    You take one last glance to make sure the man is gone and fly in. 
    {
    - awareness == 20:
    There are a few recognizable items, but everything mostly looks new. You don't know what you're even looking for so you start to examine everything. An hour later a crunching noise can be heard outside, drawing nearer and nearer. Disappointingly, having not found anything significant, you decide to head back outside. As soon as you're about to fly out the window, a picture hanging on the wall grabs your attention. It is of a young, red-headed girl. This ignites a flame inside of you, for reasons unbeknownst to yourself. You stay there mesmerized by her elegant beauty. Just then something goes over your head and everything turns dark. Perhaps you should have searched for a companion before going on this endeavor...
    ->END
      - awareness == 40:
    There are many recognizable items. You don't know what you're looking for but you have a feeling you'll find something interesting on the second floor. After heading up you search...and search...and search...
    
    Eventually you come across an item with strange symbols. You feel like you know what it is but can't fully comprehend it. While looking at it you are bombarded with visions of a red-headed girl doing something to this bizarre commodity that's linked to other bizarre commodities. And that's when it dawns on you, the girl is putting her thoughts into it, this is a diary! 
    You're not able to read the writing but by looking at each page, somehow, thoughts appear in your mind, memories of what the girl was thinking when writing.
        ->read_diary
    - awareness == 60:
    The house seems more familiar than the forest that you've lived in your whole life. Somehow you already know a specific item will be there before even looking. And after you do look at an item you are instantly reminded of what function they have. 
    A broom - for cleaning the house.
    A bucket - for carrying water.
    A bed - for sleeping.
    This excites you, it's like remembering a whole new world, a world that you've previously known about. 
    Just then something goes over your head and everything turns dark. Fear engulfs you and it feels like you've already experienced this before. You try to fly and get yourself free but to no avail. All of a sudden you hear a familiar howl and some growling. Whatever you were in drops to the floor, hurting your back. Yet, as long as you're free, you don't care. 
    You quickly get out and notice the man next to you, blood running down his eyes. Beside him is the very same wolf you saved from the impoverished log. His gaze is towards a particular picture on the wall, a picture of a young girl hugging a young boy. A tear runs down his face and as he turns his eyes towards you everything now makes sense. We were torn apart, drowned, by our father, or whatever replaced him once he got ahold of the red lake's water. However, now, we are back together again! We can continue our lives! 
    Yet  this exhilarating happiness is short-lived as an overwhelming thirst takes hold of you...
    ->END
    
    
    }
    =read_diary
    +[Turn to page 1]
    Dear Diawy,
    
    Today has been a wonderful day! After hunting, father came home really excited! Not only did he catch 2 rabbits, which were very very tasty, but he also found a really cool lake! He said the water from it has made him smarter and has given him new memories, he calls them "memories from previous lives"!! Tomorrow he's gonna go back and bring home a full bucket!
 
    ->read_diary
    +[Turn to page 2]
    Dear Diawy,
    
    Today father brought home a full bucket of water from the lake, and he drank it all not long after bringing it. A bit later he started not feeling well and asked us to go bring him more of the same water. We were excited because he never lets us out into the forest!
    ->read_diary
    +[Turn to page 3]
    Dear Diawy,
    
    Today father left early in the morning to go hunting and came home very late. He did not catch anything and was wet from head to toe. When my brother and I asked what was for dinner he started yelling, and then muttered "The lake needs blood" over and over again. I don't know what is happening to him but I'm worried!
    ->read_diary
     +[Turn to page 4]
    Dear Diawy,
    
    Father is angry all the time, he even hit my brother. We are very scared.
    ->read_diary
     +[Turn to page 5]
    Dear Diawy,
    
    My brother and I are thinking of running away.
    ->read_diary
    +[Stop reading diary]
    After reading the diary you are more confused then ever. Who is this girl? What happened to her? Is the man that lives here her father? And how are you able to receive these visions? Maybe they are not visions...could they be memories?
    Just then something goes over your head and everything turns dark. Perhaps you should have searched for a companion before going on this endeavor...
    ->END
 
    = continue_staring
    No, entering the house seems too dangerous, and you still feel a little lightheaded. Perhaps you'll go the next day? An hour later you see the man return with bloody hands. Where has he gone? What has he done?
    The next day the man came out at around the same, with the same metal item. After leaving your field of view you notice that the window is, again, open. "I guess he likes the cold breeze, it suits his cold personality", you think. 
     * [Enter the house]
    -> enter_house
    
    + [Continue looking]
    -> conflict.continue_staring
-> END
