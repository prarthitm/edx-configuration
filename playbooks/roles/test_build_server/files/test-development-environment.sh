#!/usr/bin/env bash
set -e
################################################################################
# This executes a small subset of the edx-platform tests.  It is intended as
# a means of testing newly provisioned AMIs for our jenkins workers.
#
# The two main things that happen here:
#   1. The setup from edx-platform/scripts/all-tests.sh, the script that is
#      run by the jenkins workers to kick off tests.
#   2. The paver command for tests, coverage and quality reports are run.
#      For the tests, it runs only a small number of test cases for each
#      test suite.
###############################################################################

# Doing this rather than copying the file into the scripts folder so that
# this file doesn't get cleaned out by the 'git clean' in all-tests.sh.
echo "----cloning edx-platform"
cd edx-platform-clone

# This will run all of the setup it usually runs, but none of the
# tests because TEST_SUITE isn't defined.
echo "----sourcing jenkins-common"
source scripts/jenkins-common.sh

# Now we can run a subset of the tests via paver.
# Run some of the common/lib unit tests
echo "----paver test_lib -t common/lib/xmodule/xmodule/tests/test_stringify.py"
paver test_lib -t common/lib/xmodule/xmodule/tests/test_stringify.py

# Generate some coverage reports
echo "----paver coverage"
paver coverage

# Run some of the djangoapp unit tests
echo "----paver test_system for lms"
paver test_system -t lms/djangoapps/courseware/tests/tests.py
echo "----paver test_system for cms"
paver test_system -t cms/djangoapps/course_creators/tests/test_views.py

# Run some of the javascript unit tests
echo "----paver test_js_run for xmodule"
paver test_js_run -s xmodule

# Run some of the bok-choy tests
echo "----three bokchoy tests"
paver test_bokchoy -t discussion/test_discussion.py:DiscussionTabSingleThreadTest
paver test_bokchoy -t studio/test_studio_with_ora_component.py:ORAComponentTest --fasttest
paver test_bokchoy -t lms/test_lms_matlab_problem.py:MatlabProblemTest --fasttest

# Run some of the lettuce acceptance tests
echo "----test_acceptance (lettuce)"
paver test_acceptance -s lms --extra_args="lms/djangoapps/courseware/features/problems.feature -s 1"
paver test_acceptance -s cms --extra_args="cms/djangoapps/contentstore/features/html-editor.feature -s 1"

# Generate quality reports
echo "----paver run_quality "
paver run_quality
