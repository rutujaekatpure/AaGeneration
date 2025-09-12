int for_() {
    int acc = 0;
    int i;
    int arr[] = {1, 2, 3, 4, 5};
    int arr_length = sizeof(arr) / sizeof(arr[0]);
    
    for (i = 0; i < arr_length; i++) {
        acc = acc + arr[i];
    }
    
    return acc;
}