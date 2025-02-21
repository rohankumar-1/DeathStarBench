from yaml import start_anomaly
import time
import argparse


# start of the 
if __name__=='__main__':
    parser = argparse.ArgumentParser(description ='start anomalous telemetry spike')
    
    # add arguments
    parser.add_argument("-a", "--anomaly", help="the type of anomaly: [cpu, ram, http, disk]")
    parser.add_argument("-d", "--duration", type=float, help="duration of anomaly in minutes")
    parser.add_argument("-w", "--delay", type=float, help="delay before anomaly starts")
    parser.add_argument("-u", "--utilization", type=int, help="utilization or throughput of anomaly")
    parser.add_argument("--url", help="url for traffic routing")
    
    args = parser.parse_args()
    
    # checks
    if args.anomaly not in ["cpu", "ram", "http", "disk"]:
        parser.error("anomaly '{}' not found".format(args.anomaly))
    if args.duration < 0:
        parser.error("duration cannot be negative")
    if args.anomaly in ["cpu", "ram"] and (args.utilization < 0 or args.utilization > 100):
        parser.error("for cpu or ram anomaly, utilization must be between 0 and 100")
    
    
    print("Sleeping") 
    time.sleep(60*args.delay) # 600s = 10min
    print("Starting spike of ", args.anomaly)
    if args.anomaly=="http" and args.url is not None:
        start_anomaly(args.anomaly, args.duration, args.anomaly, args.url)
    else:
        start_anomaly(args.anomaly, args.duration, args.anomaly)
