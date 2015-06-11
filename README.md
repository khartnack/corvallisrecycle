# corvallisrecycle

Download the xCode project: 
Once downloaded and unzipped, you double click on “CorvallisRecycle.xcodeproj.
There is an issue with the scheme with other users to fix this go into the folder with the project(CorvallisRDD) right click the file called CorvallisRRD.xcodeproj and select show package contents
From here go into xcuserdata and rename the file dbeltramini77.xcuserdatad to whatever the username of the mac that is going to run the code is .xcuserdatad, for example my username on my mac is ryanmckelvey
Then go back up one file and right click project.xcworkspace and again show package contents select the file labeled xcuserdata
Then again rename the file dbeltramini77.xcuserdatad to the username.xcuserdatad 
If this is not done due to a scheme issue the code will give a d linker error because it is looking for scheme called CorvallisRRD 2.xcscheme instead of CorvalissRRD.xscheme which is what it defaults to when running it without this change. 
Once this done open the project in XCode by double click the CorvallisRRD.xcodeproj
In XCode, you are going to want to run the simulator.  Select the iPhone6 and then Product > Run.
