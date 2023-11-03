#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <map>
#include <exception>
#include <chrono>

struct Job
{
    uint16_t start = 0;
    uint16_t end = 1;

    inline uint16_t duration() const { return end - start; } 
};

using Server = std::vector<Job>;

std::vector<Job> CreateWihRandomJobs(size_t size)
{
    static std::random_device rd;
    static std::mt19937 gen(rd());

    std::vector<Job> jobs;
    jobs.reserve(size);
    
    std::uniform_int_distribution<uint16_t> distribStart(0, 23);
    
    for(size_t i = 0; i < size; ++i)
    {
        uint16_t start = distribStart(gen);

        std::uniform_int_distribution<uint16_t> distribEnd(start + 1, 24);
        uint16_t end = distribEnd(gen);

        jobs.push_back({
            .start  = start,
            .end    = end,
        });
    }

    return jobs;
}
void PrintJob(const Job& job)
{
    std::cout 
        << "{ start: " << job.start
        << ", end: " << job.end
        << " }";
}
void PrintJobs(const std::vector<Job>& jobs)
{
    for(const auto& job : jobs)
    {
        PrintJob(job);
    }
    
    std::cout << std::endl;
}
void PrintJobsMap(const std::map<uint16_t, std::vector<Job>>& jobsMap)
{
    for(const auto& [ key, jobs ] : jobsMap)
    {
        std::cout << key << " :" << std::endl;
        PrintJobs(jobs);
    }
}
void PrintServers(const std::vector<Server>& servers)
{
    size_t index = 1;
    for(const auto& server : servers)
    {
        std::cout << "Servers n°" << index << std::endl;
        PrintJobs(server);
        index++;
    }
}

const std::vector<Job> inJobs = CreateWihRandomJobs(100000);
std::vector<Server> outServers;

bool TryPopFirstAvailableJob(Job& outJob, std::map<uint16_t, std::vector<Job>>& jobsMap)
{
    for(auto& [ key, jobs ] : jobsMap)
    {
        if(jobs.size() > 0)
        {
            outJob = jobs.back();
            
            jobs.pop_back();
            if(jobs.size() == 0)
            {
                jobsMap.erase(key);
            }

            return true;
        }
    }

    return false;
}

void Compute()
{
    std::vector<Job> jobs(inJobs);
    std::map<uint16_t, std::vector<Job>> jobsMap;
    
    for(auto& job : jobs)
    {
        jobsMap[job.start].push_back(job);
    }
    
    for(auto& [ key, val ] : jobsMap)
    {
        std::sort(val.begin(), val.end(), [](const Job& a, const Job& b) 
        {
            return a.end < b.end;
        });
    }

    // create servers for all jobs who start at 0

    for(auto& job : jobsMap.at(0))
    {
        outServers.push_back({ job });
    }

    jobsMap.erase(0);
    
    while (jobsMap.size())
    {
        bool createEmptyServer = true;

        for(auto& server : outServers)
        {
            auto job = server.back();
            auto shouldStartAt = job.end;
            
            while(true)
            {
                if(jobsMap.contains(shouldStartAt))
                {
                    auto nextjob = jobsMap.at(shouldStartAt).at(0);
                    
                    jobsMap.at(shouldStartAt).pop_back();
                    if(jobsMap.at(shouldStartAt).size() == 0)
                    {
                        jobsMap.erase(shouldStartAt);
                    }

                    server.push_back(nextjob);
                    break;
                }
                else if(shouldStartAt < 24)
                {
                    shouldStartAt++;
                }
                else
                {
                    createEmptyServer = true;
                    break;
                }
            }
        }

        if(createEmptyServer)
        {
            Job newJob;
            if(TryPopFirstAvailableJob(newJob, jobsMap))
            {
                outServers.push_back({
                    newJob
                });
            }
            else
            {
                throw std::runtime_error("Alors lo chépo");
            }
        }
    }
}

int main()
{
    std::cout << "Start computation" << std::endl;
    auto start = std::chrono::system_clock::now();

    Compute();

    auto end = std::chrono::system_clock::now();
    auto elapsed = end - start;
    std::cout
        << "Computed in : "
        << std::chrono::duration_cast<std::chrono::seconds>(elapsed).count()
        << "s "
        << std::chrono::duration_cast<std::chrono::milliseconds>(elapsed).count()
        << "ms"
    << std::endl;

    //PrintServers(outServers);

    std::cout << "Score : " << inJobs.size() - outServers.size() << std::endl;
}