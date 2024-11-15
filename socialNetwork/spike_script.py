from yaml import trigger_cpu
import multiprocessing
import time

# start of the 
if __name__=='__main__':
    print("Sleeping") 
    # to allow for us to capture increase in metrics
    time.sleep(600) # 600s = 10min
    
    print("No of cpu:", multiprocessing.cpu_count())
    processes = []
    for _ in range (multiprocessing.cpu_count()):
        p = multiprocessing.Process(target=runspike, args=(1200, 90)) # 600s spike, at 40% utilization
        p.start()
        processes.append(p)
    for process in processes:
        process.join()
