/*
 * Author: Mark Beltran
 * Date: May 9, 2023
 * 
 * Calculate reimbursement, $0.35 / mile
*/

#include <stdio.h>

int main(void) {
    long double prev_odo;
    long double curr_odo;

    printf("***MILEAGE REIMBURSEMENT CALCULATOR***\n");
    printf("Enter beginning odometer reading: ");
    scanf("%lf", &prev_odo);
    printf("Enter current odometer reading: ");
    scanf("%lf", &curr_odo);

    reimburse(prev_odo, curr_odo);

    return 0;
}

void reimburse(long double prev_odo, long double curr_odo) {

}