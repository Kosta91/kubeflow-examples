#!bin/sh

PERF_TIME=${1}

if [ ${PERF_TIME} = 'FAST' ]
then
    echo "Loading test_data/splitted_500recs/github_issues00.csv.."
    cp test_data/splitted_500recs/github_issues00.csv ${DATA_DIR}/github_issues.csv
else
    if [ ${PERF_TIME} = 'MEDIUM' ]
    then
	echo "Loading test_data/github_issues_sample.csv.."
	cp test_data/github_issues_sample.csv ${DATA_DIR}/github_issues.csv
    else
	echo "Downloading remote github-issues.zip (2.6Gb).."
	wget --directory-prefix=${DATA_DIR} https://storage.googleapis.com/kubeflow-examples/github-issue-summarization-data/github-issues.zip
	unzip ${DATA_DIR}/github-issues.zip -d ${DATA_DIR}
    fi
fi
