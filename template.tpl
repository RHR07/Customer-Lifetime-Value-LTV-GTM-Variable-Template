___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Customer Lifetime Value (LTV)",
  "description": "Tracks the customer’s lifetime purchase value via a cookie. by RHR",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "current_event",
    "displayName": "Built-in Event Name",
    "simpleValueType": true,
    "help": "Built-in GTM variable e.g. {{Event}}"
  },
  {
    "type": "TEXT",
    "name": "target_event",
    "displayName": "DataLayer Event Name",
    "simpleValueType": true,
    "help": "Enter the purchase event name from the Data Layer."
  },
  {
    "type": "TEXT",
    "name": "total_value",
    "displayName": "DataLayer Total Value",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const getCookieValues = require('getCookieValues');
const setCookie = require('setCookie');
const currentEvent = data.current_event;
const targetEvent = data.target_event;
let totalValue = data.total_value * 1 || 0;
totalValue = ((totalValue * 100 + 0.5) | 0) / 100;
const cookieName = 'lifetime_value';
let currentValue = 0;
const existing = getCookieValues(cookieName);
if (existing && existing.length > 0) {
  const num = existing[0] * 1;
  if (num * 0 === 0) currentValue = num;
}
if (currentEvent === targetEvent) {
  currentValue += totalValue;
  currentValue = ((currentValue * 100 + 0.5) | 0) / 100;
  setCookie(cookieName, '' + currentValue, {
    'max-age': 31536000,
    'path': '/'
  });
}
return currentValue;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "lifetime_value"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "set_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedCookies",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "name"
                  },
                  {
                    "type": 1,
                    "string": "domain"
                  },
                  {
                    "type": 1,
                    "string": "path"
                  },
                  {
                    "type": 1,
                    "string": "secure"
                  },
                  {
                    "type": 1,
                    "string": "session"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "lifetime_value"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "/"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 10/16/2025, 2:44:37 PM


