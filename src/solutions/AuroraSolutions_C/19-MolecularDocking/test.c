#include <stdio.h>
#include <stdint.h>

#if defined (ENABLE_TRACE)
#include <ftrace.h>
#endif

#include "defines.h"

/*
 * This kernel function sums the evaluation counter states
 * which are stored in evals_of_new_entities array foreach entity,
 * calculates the sums for each run, and stores it in evals_of_runs array.
 *
 * The number of groups which should be started equals to num_of_runs,
 * since each group performs the summation for one run.
 */



uint64_t libkernel2( unsigned int  pop_size,
                     int64_t       VEMVA_dockpars_evals_of_new_entities,
                     int64_t       VEMVA_evals_of_runs,
                     int           num_wg)






{
  #ifdef PRINT_ALL_KRNL
  printf("Starting libkernel2 ... \n");
  #endif

  int* dockpars_evals_of_new_entities = (int*) VEMVA_dockpars_evals_of_new_entities;
 
  int* evals_of_runs                  = (int*) VEMVA_evals_of_runs;




  unsigned int j;






  !NEC$ivdep(partsum_evals[i])
  for (j = 0; j < num_wg; j++) 

  { // Iterate over individuals (work-groups)
   
    int                entity_counter;
    int                sum_evals;
    int                partsum_evals[NUM_OF_THREADS_PER_BLOCK];
    unsigned int       i;

    #if defined (ENABLE_TRACE)
    ftrace_region_begin("KERNEL2_INNER_LOOP_1");
    #endif
   

 for (i = 0; i < NUM_OF_THREADS_PER_BLOCK; i++) 

  {
      partsum_evals[i] = 0;
  }
    
    #if defined (ENABLE_TRACE)
    ftrace_region_end("KERNEL2_INNER_LOOP_1");
    #endif

    #if defined (ENABLE_TRACE)
    ftrace_region_begin("KERNEL2_INNER_LOOP_2");
    #endif
    



for (entity_counter = 0; entity_counter < pop_size; entity_counter++)

 {
   unsigned int local_id    = entity_counter % NUM_OF_THREADS_PER_BLOCK;
   partsum_evals[local_id] += dockpars_evals_of_new_entities[j * pop_size +       entity_counter];
    
 }
    #if defined (ENABLE_TRACE)
    ftrace_region_end("KERNEL2_INNER_LOOP_2");
    #endif

    sum_evals = partsum_evals[0];

    #if defined (ENABLE_TRACE)
    ftrace_region_begin("KERNEL2_INNER_LOOP_3");
    #endif
    




for (entity_counter = 1; entity_counter < NUM_OF_THREADS_PER_BLOCK; entity_counter++)

 {
      sum_evals += partsum_evals[entity_counter];
   
 }
    #if defined (ENABLE_TRACE)
    ftrace_region_end("KERNEL2_INNER_LOOP_3");
    #endif

    evals_of_runs[j] += sum_evals;
  }

  #ifdef PRINT_ALL_KRNL
  printf("\tFinishing libkernel2\n");
  #endif
  return 0;
}





int main() 

{
  
   uint64_t libkernel2( unsigned int  pop_size,
                        int64_t       VEMVA_dockpars_evals_of_new_entities,
                        int64_t       VEMVA_evals_of_runs,
                        int           num_wg );
 

  printf("Done!\n");

}


