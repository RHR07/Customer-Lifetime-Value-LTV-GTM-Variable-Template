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
