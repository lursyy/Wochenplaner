<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
<title>T-Rex Game</title>
<meta name="description" content="Ripped T-Rex/Dino game of Chromium">

<script src="https://apis.google.com/js/platform.js" async defer></script>


<script src="dino.js"></script>




	<style>
	/* Copyright 2014 The Chromium Authors. All rights reserved.
   Use of this source code is governed by a BSD-style license that can be
   found in the LICENSE file. */

a {
  color: #585858;
}

body {
  background-color: #f7f7f7;
  color: #585858;
  font-size: 125%;
}

body.safe-browsing {
  background-color: rgb(206, 52, 38);
  color: white;
}

button {
  background: rgb(76, 142, 250);
  border: 0;
  border-radius: 2px;
  box-sizing: border-box;
  color: #fff;
  cursor: pointer;
  float: right;
  font-size: .875em;
  height: 36px;
  margin: -6px 0 0;
  padding: 8px 24px;
  transition: box-shadow 200ms cubic-bezier(0.4, 0, 0.2, 1);
}

[dir='rtl'] button {
  float: left;
}

button:active {
  background: rgb(50, 102, 213);
  outline: 0;
}

button:hover {
  box-shadow: 0 1px 3px rgba(0, 0, 0, .50);
}

.debugging-content {
  line-height: 1em;
  margin-bottom: 0;
  margin-top: 0;
}

.debugging-title {
  font-weight: bold;
}

#details {
  color: #696969;
  margin: 45px 0 50px;
}

#details p:not(:first-of-type) {
  margin-top: 20px;
}

#error-code {
  color: black;
  opacity: .35;
  text-transform: uppercase;
}

#error-debugging-info {
  font-size: 0.8em;
}

h1 {
  -webkit-margin-after: 16px;
  color: #585858;
  font-size: 1.6em;
  font-weight: normal;
  line-height: 1.25em;
}

h2 {
  font-size: 1.2em;
  font-weight: normal;
}

.hidden {
  display: none;
}

.icon {
  background-repeat: no-repeat;
  background-size: 100%;
  height: 72px;
  margin: 0 0 40px;
  width: 72px;
}

input[type=checkbox] {
  visibility: hidden;
}

.interstitial-wrapper {
  box-sizing: border-box;
  font-size: 1em;
  line-height: 1.6em;
  margin: 50px auto 0;
  max-width: 600px;
  width: 100%;
}

#malware-opt-in {
  font-size: .875em;
  margin-top: 39px;
}

.nav-wrapper {
  margin-top: 51px;
}

.nav-wrapper::after {
  clear: both;
  content: '';
  display: table;
  width: 100%;
}

#opt-in-label {
  -webkit-margin-start: 32px;
}

.safe-browsing :-webkit-any(
    a, #details, #details-button, h1, h2, p, .small-link) {
  color: white;
}

.safe-browsing button {
  background-color: rgb(206, 52, 38);
  border: 1px solid white;
}

.safe-browsing button:active {
  background-color: rgb(206, 52, 38);
  border-color: rgba(255, 255, 255, .6);
}

.safe-browsing button:hover {
  box-shadow: 0 2px 3px rgba(0, 0, 0, .5);
}

.safe-browsing .icon {
  background-image: -webkit-image-set(
      url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAMAAABiM0N1AAABoVBMVEX///+Li4v////////y8vL09PT99fTbRDfXzMzt7e3v7+/s7Ozy8vLw8PDu7u799PPSQTXx8fHZdGv19fX09PTm5ubbV0zXzczgW1Dd3d3c3Nzjb2Th4eHr6+vl5eXp6enZ2dng4OD29vbz8/PYYFXZV0zaYVbjbWP219TRQTTXdGz43Nn++/rib2T////b29vTQjXaYVf66ObngXjjbmTq6ura2trngHf76Ofk19bX19fe3t7o6Oji4uLk5OTeU0f119TYQzbZQzbWQjbXQzbZRDfaRDfn5+fbV0vj4+PVQjXf39/Y2Njgcmney8rqk4zdysn43drcysjcUETa1tbadGvaV0vaWEzZYVbibmXc2NjfzMvi0M7mfHPYYVbhzszd2dnZx8XieXDkc2nWX1Xacmne2trZdGzbcWjj0c/XTUHX1NPVX1Xg3NzYdGvYXFHZ1dXWTUHgzczUX1Xh3d3XdWzWXFHaVkvXxcTVTEHhbmXTXlXi3t7ayMbVXFLgbmXUTEDXYFXSXlTXzMvk4ODUXFHWbGPWzMvk4eHZioP39/f9Ro5BAAAABnRSTlMAAOQk5ye8yu+CAAACRklEQVR4XrXWRZPbUBSEUWdmIpl5mJmZg8zMzMzMzPCr43isNqif76u6lW+nuzgrtUqB/1ptzUSVamrVDiS1A0ntQFI7kNQOJLUDSe1AUjuQ1A4ktQNJ70DSO5D0DiS9A0nvQIKjlOAoJThqyewsXZ1hQOL8YZNkcJrcJiIlBt2No0zKQSbHJVJiznW5BIg4kMocSDIEBxKcwvkoJAE6uMJAguO13xIaWyyRiDPdGGGQJBFnzb4Qh2Qp0VrmdHXFCSRKxFmYDAsQpNkSiTgtLZAAydIgcZqbYwQSJOqs3QsJkCRxp7s7RSBBok5bW5RAgkSd9bujIoS3AA0QZ0NHrx3ktLro5SvidNRnAUkO2nWZOPU7s4BEB9J74qzrzACSHNRwhDid8xlAogPpEHHa23sIxJyB60XpAHEioT9myBnf4XWq8W4aDw1niROKA/I7270u5HbxKI3Hk0+IEzZBzuktXn35XRw7jsOJi34nZoCcN5u9+gq7OJPGqf+czzFAzsdtXp+xi0tpHPtvVzopDl3Z6nUtWNzXjZs436p0DNDQnT0r3QuW7vT+g8L54XKlEzX8RAw9nvrX02D53p89z59f+J0602/NptfJZPKt52AX70Zy5w/EWR0wSp+Gv3z1f3++jQx/545Z+vGTfcd+/eYOJFIEDtkpccxSyNqRpLitI0uWjiyFLR1ZignOqoC1VN0BJEupag4gK8nsALKToiYHkK3Uyx0CiRJ3ANlLWe4AspcyxKGQLHEHkL3UQxwKyRJxCKTtLyVXfw+a8JTgAAAAAElFTkSuQmCC) 1x,
      url(data:image/png;base64,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) 2x);
}

.small-link {
  color: #696969;
  font-size: .875em;
}

.ssl .icon {
  background-image: -webkit-image-set(
      url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABICAYAAABV7bNHAAAGEElEQVR4Xu3aa4iUVRzHcU2DCkKLfSEk0btq7+s6O87edO3ei5BemEm+9kVEIJQgZiIFCaGW9cKiqJSQgm5GauOOu+p63Wa3i7lrm9uNNlZxZ9lEurin75k/HHYmzj777JxnePZhBr64+Orshzm/ZwZ2llJqkko5ACgBlYB+uDfusjmUoHW0h7roNxolJfGz/F8X7aF1lKA50zjDjAGqp100TGqaDdMuqo8SUIySpByXpNhMBrqRdtA1UgF1jXbQTTMN6DbqJlWkumnhTAFaSIOkitygIIUbaB71TwHgD3qH1lIT3U43G2T5+Q5aSk/SXro8BaR+mhdmoA89YM7QCpo7jU27gdZQnwfSB2EFWjEJzF/0FM0WgIK6nrZ4jP+KsAHNpQsWnCvUJgBOe4z+tQBdoLlhAlpFytIaAQikdaQsPR4moHYLzj4BCKzZdMwClAoL0AL7HshXgoBbNsmHyAUhALJerx4BKEp9tmsWBqCdFqAXigj0sgVoZxiAkhagR4oI9KgFKBkGoAEL0J1FBLrLAvRjGIAyFqBbigh0qwUoEwagvy1A1xURaI4F6J8wAClLs4qcshQ2oBJQGa2n02Z/wl2GTtN6KgsaaDWNkJqhjdDqoICeIRWRnnUNtJLGIwQ0TiudAAEwn4ZJRaxhmu8CaCOpiPacC6DuCAOlXQBlIgx01QWQinIloBLQFCsBlYBKQCWg+5aooRc36n+nBfD78+vVwINNEQUCZXT/Z0q/Rj7a6xvp0puvKf0a62zXSBEAsuCQTySDYxo7khKkqACNfvGpgfGLdOmNnaKS1+WOQ2rggcZoAF18fZtS4+O+kOw40uB7b6nulrpoAPlH8sZJxsqzgRRiIPdInjg/7X7b4Bxq0FWor1rrQgrkHsk3TrsuXqHSrYsiAOSNNC2cVLZKQYoAUA6SK5zDuiWCFAGgHCRnOB3UST1LF0UBSPrz+BErzui5syoJhg8cqlJHElWCVAyg8wAE1cVdr3puz8/vv6uSYAAFEAEDEFUCRKAIEIHTmZAEqd7jDGEEsuPYkfbuBqbSF87RRLU62litekEKFKgfANcNC46vfgGpHQg/OMd0gmQ5iwugewBw1uQ4gwxy37aXZLitSFVkgKhKdSTIAFXrQJKOJWpAqhGk/53HCVCDchQ4r0yKc3Bxuc4TKQUK40zAAEQyzpS9XhI48g7qouPUy3DnnalwoD4AXOSNc3e2L2O6ctUPku31K0iHszDm6eWBI51okneSOZd7IPc4F8A5AIzuYExXDhA1TAEJCAEy+5O7QQIkSOCQQXIGdA6AQuq7P6GupM/4xklmq7AiDe37WHUC4A9HOtlcq3qX1XO+EADp+h9uFaQ8nP3A6A7EdOyPDhiAqAIgioO0PRdp6PNPVAcAbI8ZZzPQjQZIkADRGSRwyCAVDPT98gblor6HWlWm+5RfHPPZ5/z2rQ5xpFMttaEBMkgDW7doGCmmKweIgAGIKgCiuAGiyuyjvefpteowAAy07A8JUrW+bgJkkGoIIAmgWgJIEqDmusKBzi6PKdfpgwoSMCTXSwcMyfUCJhs4cSklj3aAJj7ewcn57DNlnLACSV0gWXFM+usFGaAq+QxEgsQOJQyQIAGiM0iAkEHKuWJUMNB3AAQVu6CBqAIgasgBAkZqJ/P1QjIblPMEs2+Q1Jy3Qy426NvlsQypoGJEzQbljHScDJBsUEoyG5Qz0vkbBAgJkgXnVEvd1cKB2mLdpIKsi8N74pi4Zom8kQZEZ5AA0RmkZoBAIUFq0UB1GihdMNA3bbFNpIKOw8sVi5MBYn9AAYjc4MgGgSNtKhjo67ZYGWVIBR1jmo9jkm/xeSOdMCNNGqiGAJIAyhlpQQLmpDTCu6isYCCUQFq8isZJBR1I+ukF0sQnmG8cuWKgkCDpKwbMCWn8REvdKmd/ad/btli3gVQx4pfJAglSFdfMAAkSIDqDBAgJkhcOgbNBAFwBLQNIWkMjpIIOpIk4phQgOoPUKJktasrboeYaAZIyx1tqnxAAh0A94EyojDZTmsZIBRXbkTvSCTPSOiuOZK7ZGBuUps1AyeY47D9orGBWe54x9AAAAABJRU5ErkJggg==) 1x,
      url(data:image/png;base64,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) 2x);
}

.styled-checkbox {
  float: left;
  height: 16px;
  margin-top: .36em;
  position: relative;
  width: 16px;
}

[dir='rtl'] .styled-checkbox {
  float: right;
}

.styled-checkbox label {
  background: transparent;
  border: white solid 1px;
  border-radius: 2px;
  height: 14px;
  left: 0;
  position: absolute;
  right: 0;
  top: 0;
  width: 14px;
}

.styled-checkbox label::after {
  background: transparent;
  border: 2px solid white;
  border-right-width: 0;
  border-top-width: 0;
  content: '';
  height: 4px;
  left: 2px;
  opacity: 0.3;
  position: absolute;
  top: 3px;
  transform: rotate(-45deg);
  width: 9px;
}

.styled-checkbox input[type=checkbox]:checked + label::after {
  opacity: 1;
}

@media (max-width: 700px) {
  .interstitial-wrapper {
    padding: 0 10%;
  }
}

@media (max-height: 600px) {
  .interstitial-wrapper {
    margin-top: 5px;
  }
}

@media (max-width: 400px) {
  button,
  [dir='rtl'] button {
    float: none;
    font-size: 1em;
    width: 100%;
  }

  #details {
    margin: 20px 0 20px 0;
  }

  #details p:not(:first-of-type) {
    margin-top: 10px;
  }

  #details-button {
    display: block;
    padding-top: 14px;
    text-align: center;
    width: 100%;
  }

  .interstitial-wrapper {
    padding: 0 5%;
  }

  #malware-opt-in {
    margin-top: 24px;
  }

  .nav-wrapper {
    margin-top: 30px;
  }

  .small-link {
    font-size: 1em;
  }
}
</style>
  <style>/* Copyright 2013 The Chromium Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file. */

/* Don't use the main frame div when the error is in a subframe. */
html[subframe] #main-frame-error {
  display: none;
}

/* Don't use the subframe error div when the error is in a main frame. */
html:not([subframe]) #sub-frame-error {
  display: none;
}

#diagnose-button {
  -webkit-margin-start: 0;
  float: none;
  margin-bottom: 10px;
  margin-top: 20px;
}

h1 {
  -webkit-margin-before: 0;
}

h2 {
  color: #666;
  font-size: 1.2em;
  font-weight: normal;
  margin: 10px 0;
}

a {
  color: rgb(17, 85, 204);
  text-decoration: none;
}

.icon {
  -webkit-user-select: none;
}

.icon-generic {
  /**
   * Can't access chrome://theme/IDR_ERROR_NETWORK_GENERIC from an untrusted
   * renderer process, so embed the resource manually.
   */
  content: -webkit-image-set(
      url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAAyCAAAAADkGq1yAAAAAnRSTlMA/1uRIrUAAABLSURBVHhe7dOxDQAgCERRdrza/ScwscNYSKIhWAror9+VR7BjKZbkrSpKeA45K8PQuoYqcUNKbmUzpNkD8kvM/ErlkVFk8necCyU7IotT35DVJRIAAAAASUVORK5CYII=') 1x,
      url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFIAAABkCAAAAAAwZDj3AAAAAnRSTlMA/1uRIrUAAABiSURBVHhe7cy7CYAwFABAd8z+HyewskkTW+EFA3kgSu4GuK2ktI71SqWyjeyxirlS2aeMQczfKcuNUjny/1KpPCbKjA+WSqVSqVQqawmy5TlZKpVPQciVSuUEpVKZtVypVF5DHE3/NzR+1AAAAABJRU5ErkJggg==') 2x);
  height: 50px;
  padding-top: 20px;
  width: 41px;
}

.icon-offline {
  content: -webkit-image-set(
      url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAvAgMAAADlfsA8AAAADFBMVEX39/f////39/dTU1NOmoBdAAAAAnRSTlMAAHaTzTgAAAB6SURBVHherc2xDUIxDIThE6UbVmEZ9nN9TUZgJWo3Ju8UhGIrHX/1FScdnr82K+PMoZizbozLsfw+OP9mkpvNARuabB6OG6fIZr4uozi4noqTYrcKHoxi63ZodLBG0a0R0c2M5Uw5Z3rzoavqwNf3CGybKH4gYXTq6wPqOghb2tvIFQAAAABJRU5ErkJggg==') 1x,
      url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFgAAABeAgMAAADaoju6AAAADFBMVEX39/f////39/dTU1NOmoBdAAAAAnRSTlMAAHaTzTgAAACDSURBVHhe7dIhDgQhAEPR6jV7urnkN3PEbkIIICCQSdfNl8/UVNe0DA/R0p7BtTzjFkesLO8nX6YUYpj8IcO48Ie+GGa4XSqYYwO4lWUPSpjH4I8s5Vg8Z7RhkeeZE2fRNc/Y5oRtu7NrC26bCKNWktEp2xueT5on/F2yLQlAQGWt+AcZixZ9AfIcYgAAAABJRU5ErkJggg==') 2x);
  height: 47px;
  margin: 0 0 40px;
  position: relative;
  width: 44px;
}

#content-top {
  margin: 20px;
}

#help-box-outer {
  -webkit-transition: height ease-in 218ms;
  overflow: hidden;
}

#help-box-inner {
  background-color: #f9f9f9;
  border-top: 1px solid #EEE;
  color: #444;
  padding: 20px;
  text-align: start;
}

#suggestion {
  margin-top: 15px;
}

#short-suggestion {
  margin-top: 5px;
}

#sub-frame-error-details {
  color: #8F8F8F;
/* Not done on mobile for performance reasons. */
  text-shadow: 0 1px 0 rgba(255,255,255,0.3);
}

[jscontent=failedUrl] {
  overflow-wrap: break-word;
}

#search-container {
  /* Prevents a space between controls. */
  display: flex;
  margin-top: 20px;
}

#search-box {
  border: 1px solid #cdcdcd;
  flex-grow: 1;
  font-size: 16px;
  height: 26px;
  margin-right: 0;
  padding: 1px 9px;
}

#search-box:focus {
  border: 1px solid rgb(93, 154, 255);
  outline: none;
}

#search-button {
  border: none;
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
  box-shadow: none;
  display: flex;
  height: 30px;
  margin: 0;
  padding: 0;
  width: 60px;
}

#search-image {
  content:
      -webkit-image-set(
          url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAPCAQAAAB+HTb/AAAArElEQVR4Xn3NsUoCUBzG0XvB3U0chR4geo5qihpt6gkCx0bXFsMERWj2KWqIanAvmlUUoQapwU6g4l8H5bd9Z/iSPS0hu/RqZqrncBuzLl7U3Rn4cSpQFTeroejJl1Lgs7f4ceDPdeBMXYp86gaONYJkY83AnqHiGk9wHnjk16PKgo5N9BUCkzPf5j6M0PfuVg5MymoetFwoaKAlB26WdXAvJ7u5mezitqtkT//7Sv/u96CaLQAAAABJRU5ErkJggg==') 1x,
          url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAeCAQAAACVzLYUAAABYElEQVR4Xr3VMUuVURzH8XO98jgkGikENkRD0KRGDUVDQy0h2SiC4IuIiktL4AvQt1CDBJUJwo1KXXS6cWdHw7tcjWwoC5Hrx+UZgnNO5CXiO/75jD/+QZf9MzjskVU7DrU1zRv9G9ir5hsA4Nii83+GA9ZI1nI1D6tWAE1TRlQMuuuFDthzMQefgo4nKr+f3dIGDdUUHPYD1ISoMQdgJgUfgqaKEOcxWE/BVTArJBvwC0cGY7gNLgiZNsD1GP4EPVn4EtyLYRuczcJ34HYMP4E7GdajDS7FcB48z8AJ8FmI4TjouBkzZ2yBuRQMlsButIZ+dfDVUBqOaIHvavpLVHXfFmAqv45r9gEHNr3y3hcAfLSgSMPgiiZR+6Z9AMuKNAwqpjUcA2h55pxgAfBWkYRlQ254YMJloaxPHbCkiGCymL5RlLA7GnRDXyuC7uhicLoKdRyaDE5Pl00K//93nABqPgBDK8sfWgAAAABJRU5ErkJggg==') 2x);
  margin: auto;
}

.hidden {
  display: none;
}

.suggestions {
  margin-top: 18px;
}

.suggestion-header {
  font-weight: bold;
  margin-bottom: 4px;
}

.suggestion-body {
  color: #777;
}

.error-code {
  color: #A0A0A0;
  margin-top: 15px;
}

/* Increase line height at higher resolutions. */
@media (min-width: 641px) and (min-height: 641px) {
  #help-box-inner {
    line-height: 18px;
  }
}

/* Decrease padding at low sizes. */
@media (max-width: 640px), (max-height: 640px) {
  body {
    margin: 15px;
  }
  h1 {
    margin: 10px 0 15px;
  }
  #content-top {
    margin: 15px;
  }
  #help-box-inner {
    padding: 20px;
  }
  .suggestions {
    margin-top: 10px;
  }
  .suggestion-header {
    margin-bottom: 0;
  }
  .error-code {
    margin-top: 10px;
  }
}

/* Don't allow overflow when in a subframe. */
html[subframe] body {
  overflow: hidden;
}

#sub-frame-error {
  -webkit-align-items: center;
  background-color: #DDD;
  display: -webkit-flex;
  -webkit-flex-flow: column;
  height: 100%;
  -webkit-justify-content: center;
  left: 0;
  position: absolute;
  top: 0;
  width: 100%;
}

#sub-frame-error:hover {
  background-color: #EEE;
}

#sub-frame-error-details {
  margin: 0 10px;
  visibility: hidden;
}

/* Show details only when hovering. */
#sub-frame-error:hover #sub-frame-error-details {
  visibility: visible;
}

/* If the iframe is too small, always hide the error code. */
/* TODO(mmenke): See if overflow: no-display works better, once supported. */
@media (max-width: 200px), (max-height: 95px) {
  #sub-frame-error-details {
    display: none;
  }
}

/* details-button is special; it's a <button> element that looks like a link. */
#details-button {
  background-color: inherit;
  background-image: none;
  border: none;
  box-shadow: none;
  min-width: 0;
  padding: 0;
  text-decoration: underline;
}

/* Styles for platform dependent separation of controls and details button. */
.suggested-left > #control-buttons,
.suggested-right > #details-button  {
  float: left;
}

.suggested-right > #control-buttons,
.suggested-left > #details-button  {
  float: right;
}

#details-button.singular {
  float: none;
}

#buttons::after {
  clear: both;
  content: '';
  display: block;
  width: 100%;
}

/* Offline page */
.offline .interstitial-wrapper {
  color: #2b2b2b;
  font-size: 1em;
  line-height: 1.55;
  margin: 100px auto 0;
  max-width: 600px;
  width: 100%;
}

.offline .runner-container {
  height: 150px;
  max-width: 600px;
  overflow: hidden;
  position: absolute;
  top: 10px;
  width: 44px;
  z-index: 2;
}

.offline .runner-canvas {
  height: 150px;
  max-width: 600px;
  opacity: 1;
  overflow: hidden;
  position: absolute;
  top: 0;
}

.offline .controller {
  background: rgba(247,247,247, .1);
  height: 100vh;
  left: 0;
  position: absolute;
  top: 0;
  width: 100vw;
  z-index: 1;
}

#offline-resources {
  display: none;
}

@media (max-width: 400px) {
  .suggested-left > #control-buttons,
  .suggested-right > #control-buttons {
    float: none;
    margin: 50px 0 20px;
  }
}

@media (max-height: 350px) {
  h1 {
    margin: 0 0 15px;
  }

  .icon-offline {
    margin: 0 0 10px;
  }

  .interstitial-wrapper {
    margin-top: 5%;
  }

  .nav-wrapper {
    margin-top: 30px;
  }
}
</style>
</head>

<body id="t">

<button onclick="alert('hallo');">hallo</button>


<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '576553495813787',
      xfbml      : true,
      version    : 'v2.2'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
<div id="main-frame-error" class="interstitial-wrapper" jstcache="0">
    <div class="onlyforchrome" style="font-size: 30px;text-align: center;font-family: Helvetica;">Running T-Rex</div>
    <div class="onlyforchrome" style="margin-top:5px;text-align:center;color:#8a8a8a;margin-bottom:80px; font-size:.8em;line-height:1.2em;font-family: Georgia;"><a href="http://www.thecodepost.org/internet/play-hidden-t-rex-game-offline-chrome/" target="_blank"><strong>T-Rex Dino game</strong></a> from Google Chrome offline mode ripped by <a href="http://www.twitter.com/thecodepost" target="_blank"><strong>@thecodepost</strong></a>.<br/> Press "Space" to jump your Dino and start the game.</div>
	<div id="main-frame-notchrome" style="display:none; margin-top:50px;">Sorry, this game only runs on the Google Chrome! You can download it free <a href="https://www.google.com/chrome">here</a></div>
    <div id="offline-resources" jstcache="0">
    <div id="offline-resources-1x" jstcache="0">
      <img id="1x-obstacle-large" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAAAyCAMAAACJUtIoAAAACVBMVEX////39/dTU1OabbyfAAAAAXRSTlMAQObYZgAAAXhJREFUeF7t2NGqAjEMANGM///RlwvaYQndULuFPJgHUYaEI6IPhgNAOA8HZ+3U6384F5y1U6YzAZTWG+dZamnFEstBFtCKJZSHWMADLJ18z+JqpQeLdKoDC8siC5iFCQs4znIxB5B1t6F3lQWkL4N0JsF+u6GXJdbI+FKW+yWr3lhgCZ2VSag3Nlk/FnRkIRbasLCO0oulikMsvmGpeiGLZ1jOMgtIP5bODivYYUXEIVbwFCt4khVssRgsgidZwQaLd2A8m7MYLGTl4KeQQs2y4kMAMGGlmQViDIb5O6xZnnLD485dIBzqDSE1yyFdL4Iqu4XJqUUWl/NVAFSZq1P6a5aqbAUM2epQbBioWflUBABiUyhYyZoCBev8XyMAObDNOhOAfiyxmHU0YNlldGAphGjFCjA3YkUn1o/1Y3EkZFZ5isCC6NUgwDBn1RuXH96doNfAhDXfsIyJ2AnolcCVhay0kcYbW0HvCO8OwIcJ3GzkORpkFuUP/1Ec8FW1qJkAAAAASUVORK5CYII=" jstcache="0">
      <img id="1x-obstacle-small" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGYAAAAjCAMAAABRlI+PAAAADFBMVEX////////39/dTU1PhglcSAAAAAXRSTlMAQObYZgAAAPNJREFUeF7tlkEKwzAMBLXr//+5iQhU7gRRQkyhZI+DhwH74jhmO+oIJBVwURljuAXagG5QqkSgBLqg3JnxJ1Cb8SmQ3o6gpO85owGlOB4m2BNKJ11BSd01owGlOHkcIAuHkz6UNpPKgozPM54dADHjJuNhZiJxdQCQgZJeBczgCAAy3yhPJvcnmdC9mZwBIsQMFV5AkzHBNknFgcKM+oyDIFcfCAoy03m+jSMIcmoVZkKqSjr1fghyahRmoKRUHYLiSI1SMlCq5CDgX6BXmKkfn+oQ0KEyyrzoy8GbXJ9xrM/YjhUZgl9nnsyTCe9rgSRdV15CwRcIEu8GGQAAAABJRU5ErkJggg==" jstcache="0">
      <img id="1x-cloud" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAOCAQAAAD6HOaKAAAAU0lEQVR4XrWSsQkAQAgD3X9El/ELixQpJHCfdApnUCtXz7o49cgagaGPaq4rIwAP9s/C7R7UX3inJ0BDb6qWDC7ScOR/QWjRlFizuPwLtTLj+qkH6DjD2wLtikUAAAAASUVORK5CYII=" jstcache="0">
      <img id="1x-text" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAL8AAAAYAgMAAADWncTDAAAABlBMVEX///9TU1NYzE1OAAAAAXRSTlMAQObYZgAAAO1JREFUeF690TFqxUAQA1BNoRtk7jMu3E9Auv9Vgr/5A863Y9zEhVhkHmhZsEGkw4Lppmllh1tcLHx+aRj2YnEDuQFvcQW+EoZY0TQLCZbEVxRxAvY+i8ikW0C0bwFdbictG2zvu/4EcCuBF0B23IBsQHZBYgm1n86BN+BmyV5rQFyCJAiDJSTfgBV9BbjvXdzIcKchpMOYd3gO/jvCeuUGFALg95J0/SrtQlrzz+sAjDwCIQsbWAdgbqrQpKYRjmPuAfU5dMC+c0rxOTiO+T6ZlK4pbcDLI1DIRaf3GxDGALkQHnD+cGhMKeox+AEOL3mLO7TQZgAAAABJRU5ErkJggg==" jstcache="0">
      <img id="1x-horizon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABLAAAAAMAgMAAAAPCKxBAAAABlBMVEX///9TU1NYzE1OAAAAAXRSTlMAQObYZgAAALJJREFUeF7t1EEKAyEMhtEvMNm7sPfJEVyY+1+ltLgYAsrQCtWhbxEhQvgxIJtSZypxa/WGshgzKdbq/UihMFMlt3o/CspEYoihIMaAb6mCvM6C+BTAeyo+wN4yykV/6pVfkdLpVyI1hh7GJ6QunUoLEQlQglNP2nkQkeF8+ei9cLxMue1qxVRfk1Ej0s6AEGWfVOk0QUtnK5Xo0Lac6wpdtnQqB6VxomPaz+dgF1PaqqmeWJlz1jYUaSIAAAAASUVORK5CYII=" jstcache="0">
      <img id="1x-trex" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQgAAAAvAgMAAABiRrxWAAAADFBMVEX///9TU1P39/f///+TS9URAAAAAXRSTlMAQObYZgAAAPpJREFUeF7d0jFKRkEMhdGLMM307itNLALyVmHvJuzTDMjdn72E95PGFEZSmeoU4YMMgxhskvQec8YSVFX1NhGcS5ywtbmC8khcZeKq+ZWJ4F8Sr2+ZCErjkJFEfcjAc/6/BMlfcz6xHdhRthYzIZhIHMcTVY1scUUiAphK8CMSPUbieTBhvD9Lj0vyV4wklEGzHpciKGOJoBp7XDcFs4kWxxM7Ey3iZ8JbzASAvMS7XLOJHTTvEkEZSeQl7DMuwVyCasqK5+XzQRYLUJlMbPXjFcn3m8eKBSjWZMJwvGIOvViAzCbUj1VEDoqFOEQGE3SyInJQLOQMJL4B7enP1UbLXJQAAAAASUVORK5CYII=" jstcache="0">
      <img id="1x-restart" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAgCAQAAADQmBIFAAAAZklEQVR4Xu3WMQoAIAxDUe/Y+58jYwV1CwQJWQT5o/DAoaWjV2i/LRym/A5FjEsR41LPQchByEHwIVAEC4gZpghmSDP8egXpr/hQZaAKQFQe+pBOQAblDC336qrlPpSg0MEjInbWTLFFmwc8TpTAAAAAAElFTkSuQmCC" jstcache="0">
    </div>
    <div id="offline-resources-2x" jstcache="0">
      <img id="2x-obstacle-large" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAABkBAMAAADOLxDzAAAACVBMVEX///9TU1P39/ea77PDAAAAAXRSTlMAQObYZgAAAa9JREFUeF7t1lFqhEAQBuG+wl6h7n/IEEgKlma2R8Vk1O4HWSh++Xzb8AKA8E4IXrlYnsXr+zgh1OdifZbBdFIApdWiWShtVhmQ+jAWMLFollCOsTzgxiyd7GcR01/YLOZf1SwsN2EBozBgAU9l4TAHkDWzCNjKApZlybO4z+GtFwu9bGKZl2TJSyxDxaoX8yyha7LGZRDqxR+ymtUsaNaWhTM+s5rl05tjNUsVz2Kxi6XqhSy4NcvbzgLSnzzvjqzgCCsiHsXSdZwVPIAVHGIhi+ABrOAAi5+Avy7HQhaycpAVpDDBsuKDAOBCrHzjQHgYhl9YsHxf+vRrsQxjVVAsDNMsF6uydBUhq+wWBq/ayCKWZekqA6DKPPEq/ZMsYllWdgGDoMdaLAzMsFwszgoAi1pDxUrWFKhZLlZnpXIkAORAs7YEoFmzQSxmt2NWs+xOP7GapRCiZjUrwFyymhX/xmpWs5rVrGZxQphmsT6LAAsvdgcBhmmWi9VZvN7+x+4K2WtgwBosFmZZvIh9IXsl8M5C1mCxLsvTfizoxfDTAfgdAIPFlVhxRqgHlrVZX9y44aEEvVqmAAAAAElFTkSuQmCC" jstcache="0">
      <img id="2x-obstacle-small" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMwAAABGBAMAAAByJ2Z/AAAADFBMVEX///9TU1P39/f///+TS9URAAAAAXRSTlMAQObYZgAAARZJREFUeF7t2NEJwzAQg2GtcCtoBe2/W6k5aK8qLgR6ToL9KPzzgR+NPCRRjg2ScjiQ9DKMCE4HRYQOJB2MJyXyQWPQgeSCDD8HnYHh10F6NbJk9KyMwpJ+hkEfnoSyGX1NUmAOqVjSz4zrNgwhm9FbMmEyuS7DpQw/Gf5kOGEYXMgwWBobnGHQmZKsYuyKDcZk8gdmM5uJMzKbgS7I5KENgJzxxN95PUMfAKi8gCXO6BQM4cM4ysEZwplyfxFDErAhmWniDKT3pJEpD2RDMpPEGUt6mOIQ1XFGmiXOZNLIgKUpgzH4lTgDtDIgmY0NznhSnWhk/v2ZkuONGOI2DEn0MNf7ttvMZjazmc2AJDkdJOlQ0sk8AC45t4r28J0GAAAAAElFTkSuQmCC" jstcache="0">
      <img id="2x-cloud" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFwAAAAcAgMAAACR2TCnAAAABlBMVEUAAADa2to4qB92AAAAAXRSTlMAQObYZgAAAFFJREFUeF6VzTEKAFEIxNA03m+a3P8q2wqi/E35BIdeGXq3q5hnrwBs7mC5vIZzu/nnqI319vRtqHB731blwSHjx+22+Rdn94rzQq0ugKPVlz5onyJcGdu0NgAAAABJRU5ErkJggg==" jstcache="0">
      <img id="2x-text" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAX4AAAAwAQMAAAAsMYMXAAAABlBMVEUAAABTU1OoaSf/AAAAAXRSTlMAQObYZgAAAPdJREFUeF7tkzFqAzEQRb9RsZ11BF0jlXSlpDdYOcFeSeCLKLeYQujHwxRrtF0gUoqo+AwfPRh4DDZByKk7tkv3rNszWhLHKv7BhtObALxF3LP44vRvRoLPTa4avoS8BLA+PSNFzyqAq/wDwNZxrxKBxq5axLGRS4EkgP6A6rrhy6ZVQLoiZKpfRJ8NqCp+HbCZpAcromNNHTfoeWS7hwnA//tROIpm17lddCbFgMAylGSZANiRhL1ou2treo0/ErB5AtAwbr8e8HK28wpwP8rmpwCv23+cPZhvK8GOCUD4lMHRALiOw8O9TAAcB2C8B7zDSvPw+8A3sQJ/MSdPGzIAAAAASUVORK5CYII=" jstcache="0">
      <img id="2x-horizon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAACWAAAAAYAQMAAABEalRSAAAABlBMVEX///9TU1NYzE1OAAAAAXRSTlMAQObYZgAAAOtJREFUeF7tljEKwzAMRb/J0CWgI/QKOYAh1+pUcjQfpUfw2MFEHVyDQSQmQUNM9AYNcobnh4egU+YVqhAvZSpgsfolPnSv5d0nz3vHslgUdK81RLzyvHcsi+WBNxQh4Ln8pw4Wi7skAg9mXgHMrEACXJnbHIllsbqGAtwXhnYswzFzwPWxWEPc2CexoobkHM4ZpD6s2loWiyIEEwCChIomMiMEHqgP573C9eHkc5VLWh3XsljnGVoLWVl+31bp38piTVVuihtPOAm9kcRLbrFjEvqwamtZLK5eI8sSan9rXEK0LcNFrY5oWawf59S7YSRD7eMAAAAASUVORK5CYII=" jstcache="0">
      <img id="2x-trex" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAhAAAABeAgMAAAAPo8UvAAAADFBMVEX///9TU1P39/f///+TS9URAAAAAXRSTlMAQObYZgAAASdJREFUeF7t1qFOBEEQRdEyGP7vGQy/hsHc/0MPSe8ylU2vKEIqqQnviRZXdI7pyUQuONda901FGAG6j8aa+6mDEUboHP01sk5EHHWEjt/UY0dk/U+Ir/cdkXUEovV1GFF/HQMR/mLWEUYYYQRrf65XRhgB2595Y80lYRjCCG7AV/IZ0FdDabgDhiKMgE+tAX01ES+ajDBCADpHZw0tRdaZCCNEGhCdNSSlQTEVYUROQGeNxxoxH2EErXU+wohdQXONqyBorDsixiB2Be01JiOM2BXQX1MRUxFGpAL6aypiMsIIJCFBtSK98fFYKd6wFDEbYUQgEYh6hTSkonbDDTAdYQTrKNd9QPWGUFwAYYRYR7U+XemGfB0ajTACWEe1Pl3thtxMhBHfOCEbEnR2KZcAAAAASUVORK5CYII=" jstcache="0">
      <img id="2x-restart" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAABAAgMAAADE0Nm5AAAACVBMVEX////39/dTU1OabbyfAAAAAXRSTlMAQObYZgAAAGNJREFUeF7d1CEOwDAMQ9GS3q/ExPcz8Sm3gYBWVRo0afvwSQl0ax1To22JntKWupfGjriSXiLViCXCmXBHCykJTxaYEeIQGcVrHYklcoX8YYpSUggzcpBTiv5JtQWorUltmS6s4ZKtz2GgjAAAAABJRU5ErkJggg==" jstcache="0">
    </div>
    <template id="audio-resources" jstcache="0">
      <audio id="offline-sound-press" src="data:audio/mpeg;base64,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"></audio>
      <audio id="offline-sound-hit" src="data:audio/mpeg;base64,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"></audio>
      <audio id="offline-sound-reached" src="data:audio/mpeg;base64,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"></audio>
    </template>
  </div>

  <script type="text/javascript">
    if (navigator.userAgent.toLowerCase().indexOf('chrome') > -1) {
      new Runner('.interstitial-wrapper');
    } else {
      document.getElementById("main-frame-notchrome").style.display="";
	}
  </script>


	  



</body>

</html>