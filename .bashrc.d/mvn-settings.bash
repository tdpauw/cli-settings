#!/bin/bash

function mvn-settings {
  rm ~/.m2/settings.xml
  ln -s ~/.m2/settings-$1.xml ~/.m2/settings.xml
}
