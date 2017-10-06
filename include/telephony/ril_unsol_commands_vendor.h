/* //device/libs/telephony/ril_unsol_commands.h
**
** Copyright 2006, The Android Open Source Project
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
*/
    {SAMSUNG_UNSOL_RESPONSE_BASE, NULL, WAKE_PARTIAL},
    {RIL_UNSOL_RELEASE_COMPLETE_MESSAGE, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_STK_SEND_SMS_RESULT, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_STK_CALL_CONTROL_RESULT, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_DUN_CALL_STATUS, responseVoid, WAKE_PARTIAL},
    // RIL_UNSOL_RESPONSE_LINE_SMS_COUNT - not used in stock RIL.java
    // RIL_UNSOL_RESPONSE_LINE_SMS_READ - not used in stock RIL.java
    {RIL_UNSOL_O2_HOME_ZONE_INFO, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_DEVICE_READY_NOTI, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_GPS_NOTI, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_AM, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_DUN_PIN_CONTROL_SIGNAL, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_DATA_SUSPEND_RESUME, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_SAP, responseVoid, WAKE_PARTIAL},
    // RIL_UNSOL_RESPONSE_NO_NETWORK_RESPONSE - not used in stock RIL.java
    // RIL_UNSOL_SIM_SMS_STORAGE_AVAILALE - not used in stock RIL.java
    {RIL_UNSOL_HSDPA_STATE_CHANGED, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_WB_AMR_STATE, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_TWO_MIC_STATE, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_DHA_STATE, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_UART, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_SIM_PB_READY, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_PCMCLOCK_STATE, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_1X_SMSPP, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_VE, responseVoid, WAKE_PARTIAL},
    // RIL_UNSOL_RINGBACK_TONE_STATE - not used in stock RIL.java
    // RIL_UNSOL_FACTORY_AM - not used in stock RIL.java
    {RIL_UNSOL_IMS_REGISTRATION_STATE_CHANGED, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_MODIFY_CALL, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_SRVCC_HANDOVER, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_CS_FALLBACK, responseVoid, WAKE_PARTIAL},
    // RIL_UNSOL_UICC_SUBSCRIPTION_STATUS_CHANGED already defined, see ril_unsol_commands.h
    {RIL_UNSOL_VOICE_SYSTEM_ID, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_SMARTAS_NOTI, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_IMS_RETRYOVER, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_STK_ALPHA_ID, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_PB_INIT_COMPLETE, responseVoid, WAKE_PARTIAL},
    // RIL_UNSOL_CP_POSITION - not used in stock RIL.java
    // RIL_UNSOL_RESPONSE_HANDOVER - not used in stock RIL.java
    // RIL_UNSOL_IPV6_ADDR - not used in stock RIL.java
    // RIL_UNSOL_NWK_INIT_DISC_REQUEST - not used in stock RIL.java
    {RIL_UNSOL_RTS_INDICATION, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_RILD_RESET_NOTI, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_HOME_NETWORK_NOTI, responseVoid, WAKE_PARTIAL},
    // RIL_UNSOL_CDMA_SIP_REG_NOTI - not used in stock RIL.java
    {RIL_UNSOL_OMADM_SEND_DATA, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_DUN, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_SYSTEM_REBOOT, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_VOICE_PRIVACY_CHANGED, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_UTS_GETSMSCOUNT, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_UTS_GETSMSMSG, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_UTS_GET_UNREAD_SMS_STATUS, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_MIP_CONNECT_STATUS, responseVoid, WAKE_PARTIAL},
    {RIL_UNSOL_STK_CALL_STATUS, responseVoid, WAKE_PARTIAL},
