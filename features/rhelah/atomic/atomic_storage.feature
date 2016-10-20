@atomic @host_subscribed @ah_upgrade
Feature: Atomic storage sanity test
    Describes the basic 'atomic storage' command test

Background: Atomic hosts are discovered
      Given "all" hosts can be pinged

  @pull_busybox_image
  Scenario: 1. Pull latest busybox image from repository
       When atomic update latest "busybox" from repository
       Then check whether "busybox" is installed

  @pull_rhel7_image
  Scenario: 2. Pull latest rhel7 image from repository
       When atomic update latest "registry.access.redhat.com/rhel7" from repository
       Then check whether "rhel7" is installed

  @run_busybox_in_bg
  Scenario: 3. docker run busybox with detach mode
       When docker run "busybox" in detach mode with "storage_test" "top -b"
       Then find latest created container by "storage_test"

  @export_storage_into_default_directory
  Scenario: 4. export all the current images, volumes, and containers into default directory
       When export containers and associated contents into default directory

  @export_storage_into_specified_directory_1
  Scenario: 5. export all the current images, volumes, and containers into specified directory
       When export containers and associated contents into "/tmp/atomic_storage_export_1"

  @export_storage_into_specified_directory_2
  Scenario: 6. export all the current images, volumes, and containers into specified directory
       When export containers and associated contents into "/tmp/atomic_storage_export_2"

  @stop_docker_service_1
  Scenario: 7 stop docker service
       When run command "service name=docker state=stopped" on "all"

  @reset_storage_1
  Scenario: 8. reset storage to its initial configuration
       When reset storage to its initial configuration

  @start_docker_service_1
  Scenario: 9. start docker service
       When run command "service name=docker state=started" on "all"

  @import_storage_from_default_directory
  Scenario: 10. import images, volumes, and containers from the default directory
       When import containers and associated contents from default directory

  @restart_docker_service_1
  Scenario: 11. restart docker service and find previously imported container
       When run command "service name=docker state=restarted" on "all"
       Then check image "busybox" have been imported
        and check image "registry.access.redhat.com/rhel7" have been imported
        and find latest created container by "storage_test"
        and find latest created container by "top -b"

  @stop_docker_service_2
  Scenario: 12. stop docker service
       When run command "service name=docker state=stopped" on "all"

  @reset_storage_2
  Scenario: 13. reset storage to its initial configuration
       When reset storage to its initial configuration

  @start_docker_service_2
  Scenario: 14. start docker service
       When run command "service name=docker state=started" on "all"

  @import_storage_from_specified_directory_1
  Scenario: 15. import images, volumes, and containers from the specified directory
       When import containers and associated contents from "/tmp/atomic_storage_export_1"

  @restart_docker_service_1
  Scenario: 16. restart docker service and find previously imported container
       When run command "service name=docker state=restarted" on "all"
       Then check image "busybox" have been imported
        and check image "registry.access.redhat.com/rhel7" have been imported
        and find latest created container by "storage_test"
        and find latest created container by "top -b"

  @stop_docker_service_3
  Scenario: 17. stop docker service
       When run command "service name=docker state=stopped" on "all"

  @reset_storage_3
  Scenario: 18. reset storage to its initial configuration
       When reset storage to its initial configuration

  @start_docker_service_3
  Scenario: 19. start docker service
       When run command "service name=docker state=started" on "all"

  @import_storage_from_specified_directory_2
  Scenario: 20. import images, volumes, and containers from the specified directory
       When import containers and associated contents from "/tmp/atomic_storage_export_2"

  @restart_docker_service_1
  Scenario: 21. restart docker service and find previously imported container
       When run command "service name=docker state=restarted" on "all"
       Then check image "busybox" have been imported
        and check image "registry.access.redhat.com/rhel7" have been imported
        and find latest created container by "storage_test"
        and find latest created container by "top -b"

  @stop_docker_service_2
  Scenario: 22. stop docker service
       When run command "service name=docker state=stopped" on "all"

  @reset_storage_2
  Scenario: 23. reset storage to its initial configuration
       When reset storage to its initial configuration

  @start_docker_service_2
  Scenario: 24. start docker service
       When run command "service name=docker state=started" on "all"
