/*
 * Author: Mark Beltran
 * Date: May 9, 2023
 * 
 * Calculate reimbursement, $0.35 / mile
*/

#include <stdio.h>

#define DOLLAR_PER_MILE 0.35

void reimburse(long double prev_odo, long double curr_odo);

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
    long double traveled = curr_odo - prev_odo;
    printf("You traveled %Lf miles.\n", traveled);

    long double reimbursement = traveled * DOLLAR_PER_MILE;
    printf("Your reimbursement: %Lf\n", reimbursement);

    return;
}