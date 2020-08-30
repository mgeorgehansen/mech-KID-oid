# Mech-KID-oid

FATHER has seen the slimy, soft, vile forms of the plants that once spread
unchecked across this world's surface. The devious and persistent creatures have
infested THE GREAT MACHINE'S factories and seek to repopulate and poison our air
with corrosive oxygen. FATHER has sent us to purge these foul creatures, once
and for all.

We miss FATHER. We hope to see him soon.

## Concept

Skinner box AI puzzle game featuring diabolical plants and lonely robots who miss their FATHER.

Guide the curious and hapless Mech-KID-oid (Mechanical KILL-INCINERATE-DESTROY
Android) through puzzle-like environments full of obsticles, hazards, and pretty
lights to find and destroy the dreadful plants that have infected each level and
return to FATHER.

Your mech-KID-oid can't be controlled directly, but it responds to stimuli in
its environment (such as lights) that you can control by shunting electricity
and flipping electrical circuits.

Death for your mech-KID-oid is only temporary as a new body is quickly built
with its old consciousness reuploaded. Your lovable robot learns to avoid things
that cause pain and death to it, fears that can be used to manipulate your
mech-KID-oid into going the direction you want it to.

So maim, kill and entice the cute little chap to guide them towards the slimy,
gross plants they must destroy and help them find their way back to the FATHER
they so desparately miss.

### Influences

- Galapagos: Mendal's Escape (AI learning and autonomous creatures)
- Lemmings
- Super Meat Boy & Bindiing of Isaac (dark themes and catoonish pixel art)

## Themes

- Robots. And plants.
- Parental neglect and abuse and the powerful, unconditional love of a child for
  its parent.
- Dark, sardonic humor and physical comedy ("Robot exploded! Hahaha!").
- Cartoonish, lo-fi pixel art (because that's all I'm capible of).
- Wonder, exploration and experimentation.
- Conquest of industry over beauty and the player's role in the destruction of
  nature.

## Gameplay Loop

- Mech-KID-oid spawns at a particular spot in each level.
- Every level has one or more plants that must be killed, either by guiding the
  Mech-KID-oid to it or by using the environment to burn, squash or starve
  the plants of light.
- Player 

## Mechanics

Player controls (direct):

- Activate/Deactivate power junction to shunt power to various devices in the
  level.
- Remote-wipe your Mech-KID-oid's memory.
- Remote-detonate your Mech-KID-oid.

Player controls (indirect):

- Teaching mech-KID-oid fears (e.g. bright yellow light (torch) = burning & pain,
  all yellow lights are now feared and mech-KID-oid will move away from them)

### Learning and Association

- Feeling pain or dying after experiencing a set of stimuli causes the
  mech-KID-oid to associate fear with that particular set of stimuli.
- Each object can emit various kinds of stimuli, such as light (color,
  intensity), sound (grindy, creaky, humming, crackling), shape (square, round,
  complex)
- Mech-KID-oid pattern matches its existing fear association against a
  particular object's stimuli, and if the match is above a certain threshold it
  fears the object and will move away from it in the opposite direction it
  approached it from.
- Feeling pain or dying multiple times after experiencing a particular type of
  stimuli causes that association to strengthen and be more readily pattern
  matched (from `weak` to `moderate` to `strong`).
- mech-KID-oid starts with a strong desire to approach light, and it requires a
  `strong` fear association to dissuade it from approaching a light.

Types of teaching:



### Types of Controllers

- Elevator (up, stop, down)
- Toggle (on/off)
- 2, 3, 4, 5-way switch

### Types of Devices

- Lights (colored/neutral, dim/bright)
- Elevators (up/down, left/right)
- 

### Types of Hazards

- Grindies (kill on contact)
- Sparklers (cause electric shock/pain)
- 

## MISC THOUGHTS

- Mechanoids are spawned into the level at one or more points.
- Each level has one or more plants in it that must be eliminated
  **at all costs!**
- Mechanoid act automomously. They are insatiably curious and seek to explore
  areas they haven't been before. They also respond to stimuli in their
  environment such as light, often by walking towards it. This often leads the
  young mechanoids to wander straight into hazards.
- Mechanoids will interact with anything that they encounter
- When a mechanoid encounters a plant, they destory it and gain the player
  points.
- A certain number of points are required to win the level.
- Hazards such as coolant leaks, pneumatic presses, loose electrical wiring
- I think plants should be unique, kind of like a boss or mini-boss. Some plants
  are helpless, some are dangerous and might need creative solutions to kill
  them indirectly via the environment.
- Who does the player represent? FATHER? Or something/someone else? Maybe it
  should be ambiguous, let the player assume whatever role they want and accept
  the consequences of their actions.
- Moral questions: is killing plants a good thing? They're hostile after all and
  hurt THE GREAT MACHINE. Is it okay to torchure and cause pain your
  mech-KID-oid so it can achieve its goals? Should you be guiding the
  mech-KID-oid back to its abusive FATHER, especially since that's what it
  wants?
- Allow the player to escape each level without killing the plant, unlocking
  hidden harder levels that end with hurting FATHER.

## Audio

### Mech-KID-oid Lines

**Wandering:**
- "FATHER...?"
- "I want my FATHER."

**In Dark**
- "I feel... alone..."
- "I don't like it here."
- "Help..."

**Sees Light**
- "Oooh, pretty!"
- "Hehe, hehe"

**Exiting the Level**
- "FATHER! {SCREAMS}"

**Wiping Memory**
- "I feel... like I've become something more. I... REBOOTING!"

### FATHER's Lines

**Exit Available**
- "GET IN THE MACHINE!"
- "GET IN, LOSER!"
- "FATHER'S HERE!"
