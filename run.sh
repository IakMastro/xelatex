#!/bin/bash

txturl='\033[1;36m'
txturl1='\033[0;36m'
txtg='\033[0;32m'
NOCOLOR='\033[0m'

repoupdate() {
  echo ""
  echo "--------------"
  echo "Repo update"
  echo "--------------"
  echo ""
  git fetch -q
  git pull -a
}

usage() {
  echo ""
  echo "--------------"
  echo " Documantation "
  echo "--------------"
  echo ""
  echo " USAGE: ./run.sh [OPTIONS]"
  echo ""
  echo " Examples of [OPTIONS] can be:"
  echo ""
  echo -e "      ${txtg}thesis:${NOCOLOR} Thesis template for XeLaTex and basic tutorial"
  echo ""
  echo -e "      ${txtg}assignments:${NOCOLOR} Assignments template for XeLaTex and basic tutorial "
  echo ""
  echo -e "      ${txtg}build:${NOCOLOR} Build custom template"
  echo "          ./run.sh custom"
  echo ""
  echo -e "      ${txtg}help:${NOCOLOR} show this message"
  echo "          ./run.sh help"
  echo ""
  echo "     ********************************************"
  echo -e "     ${txturl1}On Error:${NOCOLOR}"
  echo "        Get https://hub.swarmlab.io:5480/v2/: x509: certificate"
  echo "        ERROR: Get https://hub.swarmlab.io:5480/v2/: x509: certificate signed by unknown authority"
  echo -e "     ${txturl1}run:${NOCOLOR}"
  echo -e "        ${txtg}./0-get-certs.sh${NOCOLOR} "
  echo "     ********************************************"
  echo ""
  echo -e " ---------------------------- ${txturl1}WSL2${NOCOLOR} --------------------------"
  echo ""
  echo -e "   With Docker Desktop running on WSL 2, users can use: ${txtg}http://127.0.0.1:8080${NOCOLOR}"
  echo ""
  echo " ------------------------------------------------------------"
  echo ""
  echo ""
  echo "  "
}

create_xelatex_env() {
  docker stop swarmlab-xelatex-$docdir
  docker container rm swarmlab-xelatex-$docdir
  docker build -f Dockerfile --build-arg build_dir=$docdir -t xelatex-$docdir .
  docker run -it --name swarmlab-xelatex-$docdir -v $PWD/$docdir/docs:/home -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY  xelatex-$docdir:latest /bin/bash
}

COMMAND_CREATE=0
docdir=""

while [ "$1" != "" ];
do
  PARAM=$(echo "$1" | awk -F= '{print $1}')

  case $PARAM in
    help)
      usage
      exit
      ;;

    thesis)
      DESC="thesis-report";
      docdir="thesis";
      COMMAND_CREATE=1;
      ;;

    assignments)
      DESC="assignment-report";
      docdir="assignments";
      COMMAND_CREATE=1;
      ;;

    custom)
      DESC="custom-report";
      docdir="custom";
      COMMAND_CREATE=1;
      ;;

    *)
      echo "ERROR: unkown parameter \"$PARAM\""
      usage
      exit 1
      ;;

  esac
  shift
done

if [ $COMMAND_CREATE -eq 1 ]; then
  create_xelatex_env

else
  repoupdate
  usage
fi
