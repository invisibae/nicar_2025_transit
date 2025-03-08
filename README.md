# nicar 2025 transit 

### by [Greg Morton](mailto:greg.morton@thebaltimorebanner.com)


Welcome to NICAR 2025! 

This repo contains the data and code for the NICAR session "Using open-source tools to investigate public transit".

During our session today, we're going to use the `r5r` package to model transit routes and accessibility in Baltimore, Maryland, as we did in the Baltimore Banner investigation ["Transit Nightmare: Thousands of Baltimore kids can’t get to school on time"](https://www.thebaltimorebanner.com/education/k-12-schools/baltimore-city-school-buses-HF3HHWC67ZF7BCRJ66WMB3VWDI/)

The `r5r` package is a powerful tool for modeling transit routes and accessibility. It's a wrapper for the open-source R5 routing engine, which is used by transit agencies around the world to plan and optimize transit routes. It's also open-source, so you can use it to model transit routes and accessibility in your own city without having to rely on proprietary software or pay for expensive data.

## Setup

Okay this is going to be a little tough. We're going to begin by using a `git pull` command to download the data and code for this session. Why? Because there's a script we need here to ensure that R plays nicely with java, which is required to run the R5 routing engine.

First, we're going to open a terminal window. If you're on a Mac, you can do this by pressing `command + space` and typing `terminal`. If you're on a PC, you can do this by pressing `windows + r` and typing `cmd`.

Next, if you're using a computer in the NICAR lab, you're going to have to navigate to the to folder where this repo lives on the desktop. The command you'll use here is

```

cd ~/Desktop/hands_on_classes/20250308-saturday-using-open-source-tools-to-investigate-public-transit

```

Then, we're going to run a git pull to download the latest data and code for this session. The command you'll use here is

```

git pull https://github.com/invisibae/nicar_2025_transit

```

Nice job! Now that you have that, we're going to quickly run a `.sh` script to ensure that R plays nicely with java. The command you'll use here is

```

bash setup_java.sh

```

Next, we'll restart our computer to ensure that the changes take effect.

Once we're back to the desktop, we'll verify our version of java by running the command

```
java -version

```

You should see something like this:

```
openjdk version "21.0.6" 

```

If you see that, you're good to go! If not, please let me know and I'll help you troubleshoot.





