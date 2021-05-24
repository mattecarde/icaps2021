# In-Station Train Dispatching: A PDDL+ Planning Approach
Support Material for the paper "In-Station Train Dispatching: A PDDL+ Planning Approach" published at [ICAPS 2021](http://icaps21.icaps-conference.org/home/). The paper can be read [here](https://ojs.aaai.org/index.php/ICAPS/article/view/15991/15802).


## Dummy Station
Because of confidentiality issues we cannot report the name of the station and other details regarding the data that cannot be disclosed by RFI. For this reason station's components names and structure has been anonymized in the PDDL files.

For this reason a dummy station was created in order to still be able to show the domain and problem files.

### Structure of the station
The dummy station reflects all the complexities of the real station used in our experiments.

![](./dummy/dummy-station.jpg)

The station has the following properties:

* 2 entry points: `W+` and `E+`
* 2 exit points: `W+` and `E+`
* 5 platforms: `I`,`II`,`III`,`IV`,`V`
* 20 itineraries: 
	* `W1`,`W2`,`W3`,`W4`,`W5`: That allow the trains to move from the `W+` entry point to a platform
	* `1E`,`2E`,`3E`,`4E`,`5E`: That allow the trains to move from a platform to the `E-` exit point
	* `E1`,`E2`,`E3`,`E4`,`E5`: That allow the trains to move from the `E+` entry point to a platform
	* `1W`,`2W`,`3W`,`4W`,`5W`: That allow the trains to move from a platform to the `E-` exit point

### Instances
In the folder `dummy` the following instances can be found:

* `1TrainDestination` where a train arrives at the entry-point `W+` and has to end his trip in a platform
* `1TrainNoStop` where a train arrives at the entry-point `W+` and has to leave from the exit-point `E-` without stopping
* `1TrainOrigin` where a train departure from the platform `III` has to leave from the exit-point `E-` 
* `1TrainStop` where a train arrives at the entry-point `W+` and has to leave from the exit-point `E-` stopping at a platform
* `2TrainStop` where two trains move inside the station
* `3TrainStop` where three trains move inside the station
* `3Trains_2Stop_1Destination` where three trains move inside the station: two of them transit and one destination
* `4Trains_2Stop_1Origin_1Destination` where three trains move inside the station: two of them transit, one destination and one origin.


If you would like to have more instances drop me an email at me [at] matteocardellini.it


