# Overtone cheatsheet

A cheatsheet for [overtone](http://github.com/overtone/overtone)

## Basics

Starting overtone live

    lein repl
    => (use 'overtone.live)

Create saw sound

    => (definst foo [] (saw 220))
    => (foo)
    => (stop)

Documentation

    => (odoc definst)

## Output/Visuals

On `overtone.live`, you can view the output of the waves with

    => (scope)

## Creating eclipse files

Followed instructions from http://rhebus.posterous.com/opening-a-leiningen-project-in-eclipse

Install plugin:

    lein plugin install lein-eclipse 1.0.0

To generate eclipse files in an existing project:

    lein eclipse

Then, in eclipse: File > Import > Existing Project into Workspace


## Misc things to look into

'#`' passes a var instead of a function, so the function can be dynamically updated and reloaded

    (apply-at (m (+ 4 beat-num)) #'metro-beats m (+ 4 beat-num) [])

Microphone

    (sound-in [0 1])
    
Sample sounds

    (sample "/Users/sam/music/samples/flibble.wav")
    
Control

    (ctl __)

OSC

    (osc-send _)

Percussion

    (doc perc)