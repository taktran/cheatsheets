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

Define instruments

    (definst wn [] (white-noise))

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

# Sound theory

> The number of vibrations that are produced per second is called frequency. Frequency varies for each sound and is measured in hertz. One hertz is equal to one vibration per second. A sound with a low frequency will have a low pitch, such as a human's heartbeat. A sound with a high frequency will have a high pitch, such as a dog whistle. Humans cannot hear sounds of every frequency. The range of hearing for a healthy young person is 20 to 20,000 hertz. The hearing range of humans gets worse with age. People lose the ability to hear sounds of high frequency as they get older. The highest frequency that a normal middle-aged adult can hear is only 12-14 kilohertz. Also, the hearing range for men worsens more quickly than the hearing range for women. This means that women will have the ability to hear notes of higher pitch than men of the same age do."

> The human ear is capable of hearing many of the sounds produced in nature, but certainly not all. Some low frequencies like a heart beat of 1 or 2 Hz can not be heard, just like sonar sounds produced by dolphins which are too high. Any frequency that is below the human range is known as infrasound. It is so low that it may be detected by a creature with big ears, such as an Elephant. In fact, recent research indicates that elephants also communicate with infrasound. Ultrasound, on the other hand, is above the range of the human ear. Bats, whales, porpoises, and dolphins use ultrasound for navigation. Most bats can detect frequencies as high as 100,000 Hz!

[Frequency Range of Human Hearing](http://hypertextbook.com/facts/2003/ChrisDAmbrose.shtml)

## Resources

* [Fourier series](http://en.wikipedia.org/wiki/Fourier_series)
* [White noise](http://en.wikipedia.org/wiki/White_noise)
* [Colors of noise](http://en.wikipedia.org/wiki/Colors_of_noise)