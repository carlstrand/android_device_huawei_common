#!/sbin/sh

# Remount system as R/W
mount -o rw,remount /system

# Add mapping for displayengine-hal-1.1
echo "(typeattributeset displayengineserver_27_0 (displayengineserver))" >> /system/etc/selinux/mapping/27.0.cil
echo "(expandtypeattribute (displayengineserver_27_0) true)" >> /system/etc/selinux/mapping/27.0.cil
echo "(typeattribute displayengineserver_27_0)" >> /system/etc/selinux/mapping/27.0.cil

# Fix logd service definition and SELinux for 8.0 vendor image
if [ "$(grep ro.build.version.release /vendor/build.prop)" = "ro.build.version.release=8.0.0" ]; then
    # Fix logd service definition
    sed -i "s/socket logdw dgram+passcred 0222 logd logd/socket logdw dgram 0222 logd logd/g" /system/etc/init/logd.rc

    # Add mapping for displayengine-hal-1.0
    echo "(typeattributeset displayengineserver_26_0 (displayengineserver))" >> /system/etc/selinux/mapping/26.0.cil
    echo "(typeattributeset displayengine_hwservice_26_0 (displayengine_hwservice))" >> /system/etc/selinux/mapping/26.0.cil


    # Add mapping for font and theme
    echo "(expandtypeattribute (dufont_service_26_0) true)" >> /system/etc/selinux/mapping/26.0.cil
    echo "(typeattribute dufont_service_26_0)" >> /system/etc/selinux/mapping/26.0.cil
    echo "(expandtypeattribute (theme_data_file_26_0) true)" >> /system/etc/selinux/mapping/26.0.cil
    echo "(typeattribute theme_data_file_26_0)" >> /system/etc/selinux/mapping/26.0.cil
    echo "(expandtypeattribute (theme_prop_26_0) true)" >> /system/etc/selinux/mapping/26.0.cil
    echo "(typeattribute theme_prop_26_0)" >> /system/etc/selinux/mapping/26.0.cil

    # Remove duplicated type definitions
    sed -i "/(type check_root_prop)/d;/(roletype object_r check_root_prop)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type cust_data_file)/d;/(roletype object_r cust_data_file)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type dmd_device)/d;/(roletype object_r dmd_device)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type exception_device)/d;/(roletype object_r exception_device)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type hisee_blkdev)/d;/(roletype object_r hisee_blkdev)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type hisee_data_file)/d;/(roletype object_r hisee_data_file)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type irda_device)/d;/(roletype object_r irda_device)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type jank_device)/d;/(roletype object_r jank_device)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type logcat_data_file)/d;/(roletype object_r logcat_data_file)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type logcat_device)/d;/(roletype object_r logcat_device)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type pmom_device)/d;/(roletype object_r pmom_device)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type secure_storage_block_device)/d;/(roletype object_r secure_storage_block_device)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type shex_block_device)/d;/(roletype object_r shex_block_device)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type splash2_block_device)/d;/(roletype object_r splash2_block_device)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type splash2_data_file)/d;/(roletype object_r splash2_data_file)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type teecd_data_file)/d;/(roletype object_r teecd_data_file)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type thirdmodem_block_device)/d;/(roletype object_r thirdmodem_block_device)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type thirdmodemnvmbkp_block_device)/d;/(roletype object_r thirdmodemnvmbkp_block_device)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type thirdmodemnvm_block_device)/d;/(roletype object_r thirdmodemnvm_block_device)/d" /system/etc/selinux/plat_sepolicy.cil
    sed -i "/(type theme_data_file)/d;/(roletype object_r theme_data_file)/d" /system/etc/selinux/plat_sepolicy.cil

    # Remove duplicated labels (Block Devices)
    sed -i "/\/dev\/block\/bootdevice\/by-name\/3rdmodem/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/dev\/block\/bootdevice\/by-name\/3rdmodemnvm/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/dev\/block\/bootdevice\/by-name\/3rdmodemnvmbkp/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/dev\/block\/bootdevice\/by-name\/hisee_fs/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/dev\/block\/bootdevice\/by-name\/sensorhub/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/dev\/block\/bootdevice\/by-name\/hisee_img/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/dev\/block\/bootdevice\/by-name\/secure_storage/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/dev\/block\/bootdevice\/by-name\/splash2/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/dev\/block\/zram0/d" /system/etc/selinux/plat_file_contexts

    # Remove duplicated labels (Cust Data)
    sed -i "/\/data\/custom.bin/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/product.bin/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/test_nv.bin/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/test_ver.bin/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/cust_ver.bin/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/facapp/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/custom_cota\\\.bin/d" /system/etc/selinux/plat_file_contexts

    # Remove duplicated labels (DMD)
    sed -i "/\/dev\/dsm/d" /system/etc/selinux/plat_file_contexts

    # Remove duplicated labels (HiSEE)
    sed -i "/\/hisee_fs(\/.*)?/d" /system/etc/selinux/plat_file_contexts

    # Remove duplicated labels (HWLog)
    sed -i "/\/dev\/hwlog_jank/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/dev\/hwlog_switch/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/dev\/hwlog_exception/d" /system/etc/selinux/plat_file_contexts

    # Remove duplicated labels (IR blaster)
    sed -i "/\/dev\/ttyAMA0/d" /system/etc/selinux/plat_file_contexts

    # Remove duplicated labels (Logging (yes dumb...))
    sed -i "/\/data\/log(\/.*)?/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/log\/gps(\/.*)?/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/log\/wifi(\/.*)?/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/hwzd_logs(\/.*)?/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/hisi_logs(\/.*)?/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/log\/hi110x(\/.*)?/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/perf_data_hs.data/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/android_logs(\/.*)?/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/log\/fingerprint(\/.*)?/d" /system/etc/selinux/plat_file_contexts

    # Remove duplicated labels (pmom)
    sed -i "/\/dev\/pmom/d" /system/etc/selinux/plat_file_contexts

    # Remove duplicated labels (Secure storage)
    sed -i "/\/sec_storage(\/.*)?/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/sec_storage_data(\/.*)?/d" /system/etc/selinux/plat_file_contexts
    sed -i "/\/data\/sec_storage_data_users(\/.*)?/d" /system/etc/selinux/plat_file_contexts

    # Remove duplicated labels (Splash2)
    sed -i "/\/splash2(\/.*)?/d" /system/etc/selinux/plat_file_contexts

    # Remove duplicated properties
    sed -i "/huawei.check.root./d" /system/etc/selinux/plat_property_contexts

fi

    # Disable parsing intra-refresh-mode parameter in libstagefright
    sed -i 's/intra-refresh-mode/intra-refresh-nope/' /system/lib64/libstagefright.so
    sed -i 's/intra-refresh-mode/intra-refresh-nope/' /system/lib/libstagefright.so

exit 0
