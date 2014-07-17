# boinc_drone
This script allows the easily deployment of a [Boinc](https://boinc.berkeley.edu) process in a farm where each drone reports back to a main application in JSON.

## Requirements
This script leverages the `boinccmd` command and will require that you have the [commandline tool](http://boinc.berkeley.edu/wiki/Boinccmd_tool) installed, configured, and running.

## Installation
Run this from your terminal:

```bash
$ gem install "boinc_drone"
```

And then execute:

```bash
$ boinc_drone -a API_KEY -u WEBHOOK_URL -w WORKER_ID # worker_id is optional, it's included for the app this was made for
```

## Usage
Every 60 seconds this script will read the commandline output of the `boinccmd --get_state` and convert it to some nice JSON and `POST` it to the supplied `WEBHOOK_URL` with `API_KEY` set as an `X-API-KEY` header. If the `POST` fails for any reason it will fail silently and just keep looping.

```json
{
  "meta":{
    "worker_id": WORKER_ID
  },
  "projects":[
    {
      "name":"LHC@home 1.0",
      "master_url":"http://lhcathome.cern.ch/lhcathome/",
      "user_name":"Matthew",
      "team_name":"",
      "resource_share":"100.000000",
      "user_total_credit":"1767.307159",
      "user_expavg_credit":"148.063753",
      "host_total_credit":"1767.307159",
      "host_expavg_credit":"148.063766",
      "nrpc_failures":"0",
      "master_fetch_failures":"0",
      "master_fetch_pending":"no",
      "scheduler_rpc_pending":"no",
      "trickle_upload_pending":"no",
      "attached_via_account_manager":"yes",
      "ended":"no",
      "suspended_via_gui":"no",
      "don't_request_more_work":"no",
      "disk_usage":"0.000000",
      "last_rpc":"1405565949.830400",
      "project_files_downloaded":"0.000000"
    }
  ],
  "applications":[
    {
      "name":"sixtrack",
      "project":"LHC@home 1.0"
    }
  ],
  "application_versions":[
    {
      "application":"sixtrack",
      "version":"451.07",
      "project":"LHC@home 1.0"
    },
    {
      "application":"sixtrack",
      "version":"451.07",
      "project":"LHC@home 1.0"
    }
  ],
  "workunits":[
    {
      "name":"sd_HL_7.5_490_1.6_4D_err__1__s__62.31_60.32__0_2__6__35_1_sixvf_boinc7",
      "fp_estimate":"1.800000e+14",
      "fp_bound":"1.800000e+17",
      "memory_bound":"95.37 MB",
      "disk_bound":"190.73 MB"
    },
    {
      "name":"sd_HL_7.5_490_1.6_4D_err__2__s__62.31_60.32__0_2__6__40_1_sixvf_boinc110",
      "fp_estimate":"1.800000e+14",
      "fp_bound":"1.800000e+17",
      "memory_bound":"95.37 MB",
      "disk_bound":"190.73 MB"
    },
    {
      "name":"sd_HL_7.5_690_1.6_4D_err__1__s__62.31_60.32__10_12__6__50_1_sixvf_boinc95",
      "fp_estimate":"1.800000e+14",
      "fp_bound":"1.800000e+17",
      "memory_bound":"95.37 MB",
      "disk_bound":"190.73 MB"
    },
    {
      "name":"sd_HL_7.5_340_1.8_4D_err__5__s__62.31_60.32__8_10__6__15_1_sixvf_boinc479",
      "fp_estimate":"1.800000e+14",
      "fp_bound":"1.800000e+17",
      "memory_bound":"95.37 MB",
      "disk_bound":"190.73 MB"
    }
  ],
  "tasks":[
    {
      "name":"sd_HL_7.5_490_1.6_4D_err__1__s__62.31_60.32__0_2__6__35_1_sixvf_boinc7_1",
      "wu_name":"sd_HL_7.5_490_1.6_4D_err__1__s__62.31_60.32__0_2__6__35_1_sixvf_boinc7",
      "project_url":"http://lhcathome.cern.ch/lhcathome/",
      "report_deadline":"Wed Jul 23 03:21:09 2014",
      "ready_to_report":"no",
      "got_server_ack":"no",
      "final_cpu_time":"0.000000",
      "state":"downloaded",
      "scheduler_state":"scheduled",
      "exit_status":"0",
      "signal":"0",
      "suspended_via_gui":"no",
      "active_task_state":"EXECUTING",
      "app_version_num":"45107",
      "checkpoint_cpu_time":"32849.200000",
      "current_cpu_time":"32864.980000",
      "fraction_done":"0.888423",
      "swap_size":"82915328.000000",
      "working_set_size":"58507264.000000",
      "estimated_cpu_time_remaining":"3262.893271"
    },
    {
      "name":"sd_HL_7.5_490_1.6_4D_err__2__s__62.31_60.32__0_2__6__40_1_sixvf_boinc110_0",
      "wu_name":"sd_HL_7.5_490_1.6_4D_err__2__s__62.31_60.32__0_2__6__40_1_sixvf_boinc110",
      "project_url":"http://lhcathome.cern.ch/lhcathome/",
      "report_deadline":"Wed Jul 23 03:21:09 2014",
      "ready_to_report":"no",
      "got_server_ack":"no",
      "final_cpu_time":"0.000000",
      "state":"downloaded",
      "scheduler_state":"uninitialized",
      "exit_status":"0",
      "signal":"0",
      "suspended_via_gui":"no",
      "active_task_state":"UNINITIALIZED",
      "app_version_num":"0",
      "checkpoint_cpu_time":"0.000000",
      "current_cpu_time":"0.000000",
      "fraction_done":"0.000000",
      "swap_size":"0.000000",
      "working_set_size":"0.000000",
      "estimated_cpu_time_remaining":"11111.865751"
    },
    {
      "name":"sd_HL_7.5_690_1.6_4D_err__1__s__62.31_60.32__10_12__6__50_1_sixvf_boinc95_1",
      "wu_name":"sd_HL_7.5_690_1.6_4D_err__1__s__62.31_60.32__10_12__6__50_1_sixvf_boinc95",
      "project_url":"http://lhcathome.cern.ch/lhcathome/",
      "report_deadline":"Wed Jul 23 04:30:48 2014",
      "ready_to_report":"no",
      "got_server_ack":"no",
      "final_cpu_time":"0.000000",
      "state":"downloaded",
      "scheduler_state":"uninitialized",
      "exit_status":"0",
      "signal":"0",
      "suspended_via_gui":"no",
      "active_task_state":"UNINITIALIZED",
      "app_version_num":"0",
      "checkpoint_cpu_time":"0.000000",
      "current_cpu_time":"0.000000",
      "fraction_done":"0.000000",
      "swap_size":"0.000000",
      "working_set_size":"0.000000",
      "estimated_cpu_time_remaining":"11111.865751"
    },
    {
      "name":"sd_HL_7.5_340_1.8_4D_err__5__s__62.31_60.32__8_10__6__15_1_sixvf_boinc479_0",
      "wu_name":"sd_HL_7.5_340_1.8_4D_err__5__s__62.31_60.32__8_10__6__15_1_sixvf_boinc479",
      "project_url":"http://lhcathome.cern.ch/lhcathome/",
      "report_deadline":"Wed Jul 23 06:30:58 2014",
      "ready_to_report":"no",
      "got_server_ack":"no",
      "final_cpu_time":"0.000000",
      "state":"downloaded",
      "scheduler_state":"uninitialized",
      "exit_status":"0",
      "signal":"0",
      "suspended_via_gui":"no",
      "active_task_state":"UNINITIALIZED",
      "app_version_num":"0",
      "checkpoint_cpu_time":"0.000000",
      "current_cpu_time":"0.000000",
      "fraction_done":"0.000000",
      "swap_size":"0.000000",
      "working_set_size":"0.000000",
      "estimated_cpu_time_remaining":"11111.865751"
    }
  ],
  "time_stats":{
    "now":"1405569063.884657",
    "on_frac":"1.000000",
    "connected_frac":"-1.000000",
    "cpu_and_network_available_frac":"0.999854",
    "active_frac":"0.999854",
    "gpu_active_frac":"0.999854",
    "client_start_time":"1405183215.367770",
    "previous_uptime":"385848.516887"
  }
}
```

## Contributing

1. Fork it ( https://github.com/msull92/boinc_drone/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License
Do whatever you want with it, just don't hurt anyone or expect me to be responsible for your use of it.
