%SI EL PROGRAMA NO FUNCIONA CORRECTAMENTE, PROBABLEMENTE SEA NECESARIO TENER QUE CREAR DESDE UN INICIO LA INTERFAZ
%A TRAVES DE LA FUNCION GUIDE Y LUEGO ASIGNAR LAS FUNCIONES AL BOTON CORRESPONDIENTE

function varargout = interfaz1(varargin)
% INTERFAZ1 MATLAB code for interfaz1.fig
%      INTERFAZ1, by itself, creates a new INTERFAZ1 or raises the existing
%      singleton*.
%
%      H = INTERFAZ1 returns the handle to a new INTERFAZ1 or the handle to
%      the existing singleton*.
%
%      INTERFAZ1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ1.M with the given input arguments.
%
%      INTERFAZ1('Property','Value',...) creates a new INTERFAZ1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfaz1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfaz1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfaz1

% Last Modified by GUIDE v2.5 08-Jun-2020 22:36:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfaz1_OpeningFcn, ...
                   'gui_OutputFcn',  @interfaz1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before interfaz1 is made visible.
function interfaz1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfaz1 (see VARARGIN)

% Choose default command line output for interfaz1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfaz1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfaz1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global work_area
global BBOX
folder='C:\Users\xsraj\Documents\MATLAB\ejemplo\bank';

nombre=get(handles.edit1,'String');

if isempty(nombre)
msj=questdlg('Ingrese nombre de usuario','Mensaje','OK','OK'); %question dialog
    if strcmp(msj,'OK')
        return;
    end
end

nombre=char(nombre);
    name=strcat(nombre,'.jpg')
    imwrite(work_area,fullfile(folder,name));
    msj=questdlg('Se guardo correctamente','Mensaje','Ok','Ok');
close(interfaz1);
interfaz;


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
set(handles.axes1,'visible','on');
axes(handles.axes1);
vid=videoinput('winvideo',1);
vid.ReturnedColorSpace='rgb';
vidRes = get(vid,'VideoResolution');
nBands = get(vid,'NumberofBands');
hImage = image(zeros(vidRes(2),vidRes(1),nBands));
preview(vid,hImage);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global vid
    global work_area
set(handles.axes2,'Visible','On');%Pantalla
set(handles.pushbutton6,'Visible','On');%opciones de imagen
set(handles.text4,'Visible','On');
set(handles.edit1,'Visible','On');%Nombre

    foto=getsnapshot(vid);
    imagen_gray=rgb2gray(foto);
    detector = vision.CascadeObjectDetector;
    BOX=step(detector,foto);
    recorte=imcrop(imagen_gray,BOX(1,:));
    work_area=imresize(recorte,[64 48]);
    axes(handles.axes2);
    imshow(foto)
    rectangle('position',BOX(1,:),'edgecolor','b','linewidth',2)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.axes1,'visible','off');
closepreview;
fondo=imread('standby.jpg');
axes(handles.axes1);
imshow(fondo);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BBOX
global work_area
[filename path]=uigetfile(('.jpg'),'Abrir Imagen');
if isequal(filename,0)
    return
else
    folder='C:\Users\xsraj\Documents\MATLAB\ejemplo';
    foto=imread(strcat(path,filename));
    imwrite(foto,fullfile(folder,'imagen_in.jpg'));%sobreescribe con este nombre
    detector = vision.CascadeObjectDetector();
    BBOX=step(detector,foto)
    axes(handles.axes2);
    imshow(foto)
    rectangle('position',BBOX(1,:),'edgecolor','b','linewidth',3)
    set(handles.text4,'Visible','On');
    set(handles.edit1,'Visible','On');%Nombre
    set(handles.text5,'Visible','On');
    set(handles.edit2,'Visible','On');%Codigo
    set(handles.pushbutton6,'Visible','On');%Guardar
    
    imagen_gray=rgb2gray(foto);
    recorte=imcrop(imagen_gray,BBOX(1,:));
    work_area=imresize(recorte,[64 48]);
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(interfaz1);
