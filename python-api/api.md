---
layout: default
---
## Top level functions

### Project functions

* create_project(name, description): Project
* get_project_by_id(project_id): Project
* get_all_projects(): list of Projects

### User function

* get_all_users(): list of Users

### Template function

* get_all_templates(): list of Templates

## Classes for Objects of Discourse

### User

*   class variables
    *   id = ""
    *   fullname = ""
    *   email = ""
*   class methods
    *   can_access(project): boolean

### Project

*   class variables
    *   id = ""
    *   name = ""
    *   description = ""
    *   size = 0
    *   mediatypes = {}
    *   _top = None
    *   source = remote_url
    *   delete_tally = {}
*   class methods
    *   rename(name, description=None): Project
    *   put(): Project
    *   delete(dry_run=False): Project with DeleteTally
    *   create_experiment(name, description): Experiment
    *   get_experiment_by_id(experiment_id): Experiment
    *   get_all_experiments(): Experiments
    *   created_directory(name, path): Directory
    *   get_directory_by_id(directory_id): Directory
    *   get_all_directories(): list of Directories
    *   get_top_directory(): Directory
    *   get_directory_list(path): list of Directories
    *   get_directory(directory_id): Directory
    *   create_or_get_all_directories_on_path(path): list of Directories
    *   add_directory(path): Directory
    *   add_file_using_directory(directory, file_name, local_path, verbose=False, limit=50): File
    *   add_file_by_local_path(local_path, verbose=False, limit=50): File
    *   add_directory_tree_by_local_path(local_path, verbose=False, limit=50): Directory
    *   fetch_sample_by_id(sample_id): Sample
    *   get_by_local_path(local_path): Directory
    *   file_exists_by_local_path(local_path, checksum=False): boolean
    *   get_all_processes(): list of Processes
    *   get_process_by_id(process_id): Process
    *   get_all_samples(): list of Samples
    *   get_sample_by_id(sample_id): Sample

### Experiment

*   class variables
    *   id = None
    *   name = ""
    *   description = ""
    *   project_id = None
    *   project = None
    *   status = None
    *   funding = ''
    *   note = ''
    *   tasks = None
    *   publications = None
    *   notes = None
    *   papers = None
    *   collaborators = None
    *   citations = None
    *   goals = None
    *   aims = None
    *   category = None
    *   samples = []
    *   processes = {} # a set
    *   delete_tally = {}
*   class methods
    *   rename(name): Experiment
    *   put(): Experiment
    *   delete(dry_run=False, delete_processes_and_samples=False): Experiment with DeleteTally
    *   create_process_from_template(template_id): Process
    *   get_process_by_id(process_id): Process
    *   get_all_processes(): list of Processes
    *   get_sample_by_id(sample_id): Sample
    *   get_all_samples(): list of Samples
    *   decorate_with_samples(): Experiment
    *   decorate_with_processes(): Experiment

### Process

*   class variables
    *   does_transform = False
    *   input_files = []
    *   output_files = []
    *   input_samples = []
    *   output_samples = []
    *   owner = ''
    *   setup = []
    *   measurements = []
    *   transformed_samples = []
    *   what = ''
    *   why = ''
    *   category = None
    *   experiment = None
    *   project = None
    *   properties_dictionary = {}
    *   direction = ''
    *   process_id = ''
    *   sample_id = ''
    *   property_set_id = ''
    *   experiments = []
    *   measurements = []
*   class methods
    *   pretty_print(shift=0, indent=2, out=sys.stdout): None
    *   rename(process_name): Process
    *   put(): Process
    *   create_samples(sample_names): Samples
    *   get_sample_by_id(process_id): Sample
    *   get_all_samples(): list of Samples
    *   add_input_samples_to_process(samples): Process
    *   add_files(files_list): Process
    *   get_setup_properties_as_dictionary(): directory of setup properties indexed by ?
    *   set_value_of_setup_property(name, value): None
    *   set_unit_of_setup_property(name, unit): None
    *   update_setup_properties(name_list): Process
    *   make_list_of_samples_with_property_set_ids(samples): list of Samples
    *   create_measurement(data): Measurement
    *   set_measurements_for_process_samples(measurement_property, measurements): Process
    *   set_measurement(attribute, measurement_data, name=None): Process
    *   add_integer_measurement(attribute, value, name=None): Process
    *   add_number_measurement(attrname, value, name=None): Process
    *   add_boolean_measurement(attrname, value, name=None): Process
    *   add_string_measurement(attrname, value, name=None): Process
    *   add_file_measurement(attrname, file, name=None): Process
    *   add_sample_measurement(attrname, sample, name=None): Process
    *   add_list_measurement(attrname, value, value_type, name=None): Process
    *   add_numpy_matrix_measurement(attrname, value, name=None): Process
    *   add_selection_measurement(attrname, value, name=None): Process
    *   add_vector_measurement(attrname, value, name=None): Process
    *   decorate_with_output_samples(): Process
    *   decorate_with_input_samples(): Process

### Sample

*   class variables
    *   id = None
    *   name = ""
    *   property_set_id = ''
    *   project = None
    *   experiment = None
    *   properties = []
    *   experiments = []
    *   property_set_id = None
    *   direction = ''
    *   sample_id = None
    *   processes = {}
    *   files = []
    *   is_grouped = False;
    *   has_group = False;
    *   group_size = 0;
*   class methods
    *   pretty_print(shift=0, indent=2, out=sys.stdout): None
    *   rename(name): Sample
    *   put(): Sample
    *   delete(): Sample
    *   update_with_details(): Sample
    *   decorate_with_processes(): Sample

### Directory

*   class variables
    *   id = ""
    *   name = ""
    *   checksum = ""
    *   path = ""
    *   size = 0
    *   # additional fields
    *   _project = None
    *   _parent_id = None
*   class methods
    *   rename(new_name): Directory
    *   move(new_directory): Directory
    *   put(): Directory
    *   delete(): Directory
    *   get_children():  list of (Directory or File)
    *   create_descendant_list_by_path(path): list of Directory
    *   get_descendant_list_by_path(path): list of Directory
    *   add_file(file_name, input_path, verbose=False, limit=50):  Directory
    *   add_directory_tree(dir_name, input_dir_path, verbose=False, limit=50): Directory

### File

*   class variables
    *   id = ""
    *   name = ""
    *   description = ""
    *   owner = ""
    *   path = ""
    *   size = 0
    *   uploaded = 0
    *   checksum = ""
    *   current = True
    *   mediatype = {}
    *   tags = []
    *   notes = []
    *   samples = []
    *   processes = []
    *   _project = None
    *   _directory_id = None
*   class methods
    *   rename(new_file_name): File
    *   move(new_directory): File
    *   put(): File
    *   delete(): File
    *   download_file_content(local_download_file_path): local (output) file_path
    *   parent(): Directory
    *   local_path(): local path

### Template

NOTE: Template is truncated, for now, as we only need the id to create a processes from a Template

*   global (static) values
    *   create = "global_Create Samples"
    *   compute = "global_Computation"
    *   primitive_crystal_structure = "global_Primitive Crystal Structure"
*   class methods
    *   pretty_print(shift=0, indent=2, out=sys.stdout): None

### Property

*   class variables
    *   setup_id = ''
    *   property_set_id = ''
    *   parent_id = ''
    *   property_id = ''
    *   required = False
    *   unit = ''
    *   attribute = ''
    *   value = ''
    *   units = [] # of string
    *   choices = [] # of string

*   class methods
    *   abbrev_print(shift=0, indent=2, out=sys.stdout): None
    *   pretty_print(shift=0, indent=2, out=sys.stdout): None

### Minor subclasses of Property

*   class MeasuredProperty
*   class NumberProperty
*   class StringProperty
*   class BooleanProperty
*   class DateProperty
*   class SelectionProperty
*   class FunctionProperty
*   class CompositionProperty
*   class VectorProperty
*   class MatrixProperty

### class Measurement

*   class variables
    *   attribute = ''
    *   unit = ''
    *   value = ''
    *   file = None
    *   is_best_measure = False
    *   measurement_id = ''
    *   sample_id = ''
    *   property_id = ''
*   class methods
    *   abbrev_print(shift=0, indent=2, out=sys.stdout): None
    *   pretty_print(shift=0, indent=2, out=sys.stdout): None

### Minor Subclasses on Measurement

*   class MeasurementComposition
*   class MeasurementString
*   class MeasurementVector
*   class MeasurementSelection
*   class MeasurementFile
*   class MeasurementInteger
*   class MeasurementNumber
*   class MeasurementBoolean
*   class MeasurementSample

