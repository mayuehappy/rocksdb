#!/usr/bin/env bash
################################################################################
#  Licensed to the Apache Software Foundation (ASF) under one
#  or more contributor license agreements.  See the NOTICE file
#  distributed with this work for additional information
#  regarding copyright ownership.  The ASF licenses this file
#  to you under the Apache License, Version 2.0 (the
#  "License"); you may not use this file except in compliance
#  with the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
# limitations under the License.
################################################################################

# fail on errors
set -e

PREFIX=java/target/frocksdb-release/frocksdbjni-${VERSION}

function deploy() {
  FILE=$1
  CLASSIFIER=$2
  echo "Deploying file=${FILE} with classifier=${CLASSIFIER} to sonatype with prefix=${PREFIX}"
  sonatype_user="mayuehappy" sonatype_pw="mayueFight2021&" mvn gpg:sign-and-deploy-file \
   --settings java/deploysettings.xml \
   -Durl=https://s01.oss.sonatype.org/service/local/staging/deploy/maven2/ \
   -DrepositoryId=ossrh \
   -DpomFile=${PREFIX}.pom \
   -Dfile=$FILE \
   -Dclassifier=$CLASSIFIER \
   -Dgpg.keyname="90F3B2B6CCCF33C966AEF3CA172ED9D726BA0EE5"  \
   -Dgpg.passphrase="mayueFight2021"
}

PREFIX=java/target/frocksdb-release/frocksdbjni-${VERSION}

deploy ${PREFIX}-sources.jar sources
deploy ${PREFIX}-javadoc.jar javadoc
deploy ${PREFIX}.jar
