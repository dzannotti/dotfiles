#!/usr/bin/env bash

#if test "$EUID" -ne 0  && groups | grep -qwv 'i2c' && getent group i2c &> /dev/null ; then
#    echo "Insufficient permissions. Run as root, our join $USER to the 'i2c' group."
#    exit 1
#fi


ARGUMENTS=("$@")
if test "${#ARGUMENTS[@]}" -lt 1 ; then
    echo "No arguments given, defaulting to 'switch'."
    ARGUMENTS=("switch")
fi || exit 1


case "${ARGUMENTS[0]}" in
    "switch")
      # if hdmi is active, then go to usb
      if ddcutil getvcp 60 | grep -q 'sl=0x11'; then
        # usb-c
        next_target="0x1b"
      # if usb is active, then go to hdmi
      elif ddcutil getvcp 60 | grep -q 'sl=0x1b'; then
        # display port
        next_target="0x0f"
      # if hdmi is active, tehn go to usb
      else
        # hdmi
        next_target="0x11"
      fi

      if test -n "${ARGUMENTS[1]}" ; then
          if test "${ARGUMENTS[1]}" == "usb-c" ; then
              next_target="0x1b"
          elif test "${ARGUMENTS[1]}" == "dp" ; then
              next_target="0x0f"
          elif test "${ARGUMENTS[1]}" == "hdmi" ; then
              next_target="0x11"
          else
              echo "Unknown/unsupported parameter '${ARGUMENTS[1]}' to argument 'switch'."
              exit 1
          fi || exit 1
      fi || exit 1

      ddcutil setvcp 60 "$next_target"
      ;;
    "single_mode")
      # exit from pip/pbp
      ddcutil setvcp E9 0x0
      ;;
    "switch_pip_size")
      # switch between small and big pip window size
      ddcutil setvcp E9 0x01
      ;;
    "switch_pip_position")
      # switch pip window position
      ddcutil setvcp E9 0x2
      ;;
    "pip_mode_small")
      # enter on pip small window size
      ddcutil setvcp E9 0x21
      ;;
    "pip_mode_big")
      # enter on pip big window size
      ddcutil setvcp E9 0x1
      ;;
    "pbp_mode")
      # enter on pbp mode
      ddcutil setvcp E9 0x24
      ;;
    "switch_video")
      # switch video sources on pip/pbp mode
      ddcutil setvcp E5 0xF001
      ;;
    "switch_usb")
      # switch usb hub target on pip/pbp mode
      ddcutil setvcp E7 0xFF00
      ;;
    *)
      echo "Invalid or unsupported argument '${ARGUMENTS[0]}'."
      echo "Use one of: switch [usb-c, dp, hdmi], single_mode, switch_pip_size, switch_pip_position, pip_mode_small, pip_mode_big, pbp_mode, switch_video, switch_usb"
      exit 1
      ;;
esac
